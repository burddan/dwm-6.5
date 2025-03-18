#!/bin/sh
wall=$(find /home/burddan/wallpapers -type f -name "*.jpg" -o -name "*.png" | shuf -n 1)
wal -i $wall
xwallpaper --zoom $wall
xdotool key Alt+F5
pywalfox update
