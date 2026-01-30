#!/bin/sh

gentoo-pipewire-launcher & 
xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Profile Enabled" 1, 0 &
xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" 0.6 &

xss-lock -- slock &
rm ~/ly-session.log
xrandr \
  --output LVDS-1 --mode 1366x768 --pos 0x0 --primary --rotate normal \
  --output HDMI-1 --mode 1024x600 --rotate left --left-of LVDS-1

acpi_listen | while read -r line; do
  if echo "$line" | grep -q "button/lid.*close"; then
    sleep 0.3
    slock
fi

done & 
