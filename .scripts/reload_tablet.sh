#!/bin/sh

set -xe

notify-send "reloading tablet"

xsetwacom --set "HID 256c:006d Pad pad" Button 1 "key ctrl z"
xsetwacom --set "HID 256c:006d Pad pad" Button 2 "key del"
xsetwacom --set "HID 256c:006d Pad pad" Button 11 "key +super p -super l"
xsetwacom --set "HID 256c:006d Pad pad" Button 12 "key +super p -super r"
