#!/bin/sh
wall=$(find "$HOME/wallpapers" -type f | shuf -n 1)
xwallpaper --zoom $wall

hellwal -i $wall --check-contrast 
xrdb -merge $HOME/.cache/hellwal/colors.Xresources
xdotool key Alt+F5
