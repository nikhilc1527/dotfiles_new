#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import io
import json
import os
import re
import shlex
import signal
import subprocess
import sys
import tempfile
import time
from pathlib import Path
from typing import Optional, Tuple, List

BUFFER_MAX_CHARS = 65536

DISCORD_CMD = "discord"

VERSION_FILE = "/opt/discord/resources/build_info.json"

WATCH_TIMEOUT_SECS = 90

DRY_RUN = False

UPDATE_REGEX = re.compile(
    r"SPLASH_UPDATE_STATE.*\{[^}]*status:\s*['\"]update-manually['\"][^}]*newVersion:\s*['\"](?P<version>\d+\.\d+\.\d+)['\"][^}]*\}",
    re.IGNORECASE | re.DOTALL,
)

NO_UPDATE_REGEX = re.compile(
    r"legacyModuleUpdater:\s*update-check-finished",
    re.IGNORECASE,
)

def log(msg: str) -> None:
    print(f"[auto-discord] {msg}", flush=True)

def read_current_version(path: Path) -> Optional[str]:
    try:
        if path.exists():
            data = json.loads(open(path, "r").read())
            if isinstance(data, dict):
                v = data.get("version")
                return str(v).strip() if isinstance(v, str) and v.strip() else None
    except Exception as e:
        log(f"Warning: could not read/parse {path}: {e}")
    return None


def write_version(path: Path, version: str) -> None:
    try:
        existing = {}
        try:
            existing = json.loads(open(path, "r").read())
            if not isinstance(existing, dict):
                existing = {}
        except Exception as e:
            log(f"Warning: invalid JSON in {path}, recreating file: {e}")
            existing = {}

        payload = dict(existing)
        payload.setdefault("releaseChannel", "stable")
        payload["version"] = version

        with open(path, "w") as f:
            json.dump(payload, f, indent=2, ensure_ascii=False)
            f.write("\n")

        log(f"Wrote version '{version}' to {path}")
    except Exception as e:
        log(f"Error writing version file: {e}")

def launch_discord_attached() -> subprocess.Popen:
    cmd = DISCORD_CMD if isinstance(DISCORD_CMD, list) else shlex.split(DISCORD_CMD)
    return subprocess.Popen(
        cmd,
        stdin=subprocess.DEVNULL,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        bufsize=1,             
        start_new_session=True,
        close_fds=True,
    )


def launch_discord_detached() -> None:
    if DRY_RUN:
        log("[DRY-RUN] Skipping detached relaunch.")
        return

    cmd = DISCORD_CMD if isinstance(DISCORD_CMD, list) else shlex.split(DISCORD_CMD)
    subprocess.Popen(
        cmd,
        stdin=subprocess.DEVNULL,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
        start_new_session=True,
        close_fds=True,
    )
    log("Discord relaunched (detached to /dev/null).")


def kill_process_tree(proc: subprocess.Popen, graceful_secs: float = 5.0) -> None:
    try:
        if proc.poll() is not None:
            return
        pgid = os.getpgid(proc.pid)
    except Exception:
        pgid = None

    try:
        if pgid is not None:
            os.killpg(pgid, signal.SIGTERM)
        else:
            proc.terminate()
    except Exception:
        pass

    t0 = time.time()
    while proc.poll() is None and (time.time() - t0) < graceful_secs:
        time.sleep(0.1)

    if proc.poll() is None:
        try:
            if pgid is not None:
                os.killpg(pgid, signal.SIGKILL)
            else:
                proc.kill()
        except Exception:
            pass

def handoff_stdout_to_drain(proc: subprocess.Popen, to_log: Optional[Path] = None) -> None:
    if proc.stdout is None:
        return

    fd = os.dup(proc.stdout.fileno())

    try:
        if to_log is not None:
            to_log.parent.mkdir(parents=True, exist_ok=True)
            subprocess.Popen(
                ["tee", "-a", str(to_log)],
                stdin=fd,
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
                start_new_session=True,   # fully detached
                close_fds=True,
            )
        else:
            subprocess.Popen(
                ["cat"],
                stdin=fd,
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
                start_new_session=True,
                close_fds=True,
            )
    finally:
        try:
            os.close(fd)
        except Exception:
            pass

    try:
        proc.stdout.close()
    except Exception:
        pass

class Outcome:
    UPDATE = "update"      
    NO_UPDATE = "no_update"
    TIMEOUT = "timeout"    

def monitor_for_outcome(proc: subprocess.Popen, timeout_secs: int) -> Tuple[str, Optional[str]]:
    """
    Reads lines from proc.stdout while maintaining a rolling buffer (multi-line-aware).
    Stops when:
      - UPDATE_REGEX matches across the buffer -> return (Outcome.UPDATE, version)
      - NO_UPDATE_REGEX matches (on any line or buffer) -> return (Outcome.NO_UPDATE, None)
      - timeout elapses or process ends -> return (Outcome.TIMEOUT, None)
    """
    if proc.stdout is None:
        log("Discord produced no stdout.")
        return Outcome.TIMEOUT, None

    start = time.time()
    buf = ""  # rolling text buffer

    for raw in proc.stdout:
        line = raw.rstrip("\n")

        # Optional: echo through for visibility
        print(line)

        # Append to rolling buffer and trim if necessary
        buf += line + "\n"
        if len(buf) > BUFFER_MAX_CHARS:
            buf = buf[-BUFFER_MAX_CHARS:]

        # Check explicit "no update" (usually single-line, but allow buffer search too)
        if NO_UPDATE_REGEX.search(line) or NO_UPDATE_REGEX.search(buf):
            log("Confirmed: no update needed (update-check-finished).")
            return Outcome.NO_UPDATE, None

        # Check multi-line update block in the rolling buffer
        m = UPDATE_REGEX.search(buf)
        if m:
            version = m.group("version")
            log(f"Detected update-needed version: {version}")
            return Outcome.UPDATE, version

        # Timeout check
        if timeout_secs > 0 and (time.time() - start) > timeout_secs:
            log(f"No signal detected within {timeout_secs}s.")
            return Outcome.TIMEOUT, None

    # If stdout iteration ends (Discord exited), treat as timeout/no decision.
    return Outcome.TIMEOUT, None

def main() -> int:
    current_version = read_current_version(VERSION_FILE)
    if current_version:
        log(f"Current recorded version: {current_version}")
    else:
        log(f"No existing version file at {VERSION_FILE}; will create on update.")

    log(f"Launching Discord: {DISCORD_CMD}")
    try:
        proc = launch_discord_attached()
    except FileNotFoundError:
        log("Error: Discord command not found. Set DISCORD_CMD correctly.")
        return 1

    try:
        outcome, new_version = monitor_for_outcome(proc, WATCH_TIMEOUT_SECS)

        if outcome == Outcome.UPDATE and new_version:
            log("Update required: stopping Discord to apply version note and relaunch.")
            if not DRY_RUN:
                kill_process_tree(proc)
            else:
                log("[DRY-RUN] Would stop Discord now.")

            if current_version == new_version:
                log(f"Version file already at {new_version}; no write needed.")
            else:
                if DRY_RUN:
                    log(f"[DRY-RUN] Would write version {new_version} to {VERSION_FILE}")
                else:
                    write_version(VERSION_FILE, new_version)

            log("Relaunching Discord (detached)...")
            launch_discord_detached()
            return 0

        else:
            handoff_stdout_to_drain(proc, to_log=None)
            if outcome == Outcome.NO_UPDATE:
                log("No update required. Updater exiting; Discord continues running.")
            else:
                log("No explicit update detected (timeout/process end). Updater exiting; Discord continues running.")
            return 0

    except KeyboardInterrupt:
        log("Interrupted; stopping Discord.")
        try:
            kill_process_tree(proc)
        except Exception:
            pass
        return 130
    except Exception as e:
        log(f"Unexpected error: {e}")
        try:
            kill_process_tree(proc)
        except Exception:
            pass
        return 2


if __name__ == "__main__":
    sys.exit(main())
