#!/bin/sh
setxkbmap -model abnt2 -layout br -variant abnt2
pipewire & 
devmon &
picom -b --config ~/.config/picom/picom.conf &
dbus-run-session bspwm
