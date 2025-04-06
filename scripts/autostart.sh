#!/bin/sh

flameshot &
picom & 
xss-lock -- betterlockscreen -l &
#pipewire &
#pipewire-pulse &
rm ~/ly-session.log
pkill wireplumber
sleep 10
wireplumber &
