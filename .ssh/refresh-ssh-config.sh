#!/bin/sh
set -eu
umask 077

cache=$HOME/.ssh/tailnet.conf
tmp=$(mktemp "$cache.XXXXXX")
trap 'rm -f "$tmp"' EXIT
trap 'exit 1' HUP INT TERM

wget --no-config --no-proxy --max-redirect=0 --timeout=2 --tries=1 -nv \
    -O "$tmp" http://ziggy:9000/hooks/ssh-config
mv -f "$tmp" "$cache"
