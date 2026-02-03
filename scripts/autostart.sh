#!/bin/sh

gentoo-pipewire-launcher & 
xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Profile Enabled" 1, 0 &
xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" 0.6 &

xss-lock -- slock &
sxhkd &

acpi_listen | while read -r line; do
  if echo "$line" | grep -q "button/lid.*close"; then
    sleep 0.3
    slock
fi

done & 
