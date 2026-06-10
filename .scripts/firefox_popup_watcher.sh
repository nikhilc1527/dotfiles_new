#!/usr/bin/env bash
set -euo pipefail

SOCKET="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"
PREFIX='[popup]'

have_cmd() {
  command -v "$1" >/dev/null 2>&1
}

if ! have_cmd socat; then
  echo "missing dependency: socat" >&2
  exit 1
fi

if ! have_cmd jq; then
  echo "missing dependency: jq" >&2
  exit 1
fi

if [[ ! -S "$SOCKET" ]]; then
  echo "Hyprland socket not found: $SOCKET" >&2
  exit 1
fi

normalize_addr() {
  local addr="$1"
  if [[ "$addr" == 0x* ]]; then
    printf '%s\n' "$addr"
  else
    printf '0x%s\n' "$addr"
  fi
}

is_firefox_popup_title() {
  local title="$1"
  [[ "$title" == "$PREFIX"* ]]
}

float_if_match() {
  local addr="$1"
  addr="$(normalize_addr "$addr")"

  # Read current client state from Hyprland.
  local client_json
  client_json="$(hyprctl -j clients | jq -c --arg addr "$addr" '.[] | select(.address == $addr)')"

  [[ -z "$client_json" ]] && return 0

  local klass title floating
  klass="$(jq -r '.class // ""' <<<"$client_json")"
  title="$(jq -r '.title // ""' <<<"$client_json")"
  floating="$(jq -r '.floating // false' <<<"$client_json")"

  [[ "$klass" != "firefox" ]] && return 0
  is_firefox_popup_title "$title" || return 0
  [[ "$floating" == "true" ]] && return 0

  hyprctl dispatch setfloating "address:$addr" >/dev/null
  hyprctl dispatch resizewindowpixel "exact 70% 70%,address:$addr" >/dev/null
  hyprctl dispatch centerwindow 1 >/dev/null
}

handle_line() {
  local line="$1"

  case "$line" in
    openwindow* )
      # format: openwindow>>ADDRESS,WORKSPACE,CLASS,TITLE
      local payload addr
      payload="${line#*>>}"
      addr="${payload%%,*}"
      float_if_match "$addr"
      ;;

    windowtitlev2* )
      # format: windowtitlev2>>ADDRESS,TITLE
      local payload addr
      payload="${line#*>>}"
      addr="${payload%%,*}"
      float_if_match "$addr"
      ;;

    * )
      ;;
  esac
}

socat -U - UNIX-CONNECT:"$SOCKET" | while IFS= read -r line; do
  handle_line "$line"
done
