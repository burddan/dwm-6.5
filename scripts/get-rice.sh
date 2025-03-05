#!/bin/sh
wall=$(find /home/burddan/wallpapers -type f -name "*.jpg" -o -name "*.png" | shuf -n 1)
wal -i $wall
xdotool key Super+F5
pywalfox update
