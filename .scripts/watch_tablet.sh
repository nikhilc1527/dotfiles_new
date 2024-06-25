#!/bin/sh

set -xe

while [ true ]; do
    while [ $(xsetwacom list devices | wc -l) -eq 0 ]; do
        sleep 0.5
    done
    notify-send "tablet connected"
    reload_tablet.sh
    while [ $(xsetwacom list devices | wc -l) -gt 0 ]; do
        sleep 0.5
    done
    notify-send "tablet disconnected"
done
