#!/bin/sh

DEVICES=$(bluetoothctl devices | cut -d' ' -f2- | sed $'s/ /\t/')
SELECTION=$(echo "$DEVICES" | fuzzel -d --with-nth 2:)
BLUETOOTH_ID=$(echo "$SELECTION" | cut -f1)
bluetoothctl connect "$BLUETOOTH_ID"
