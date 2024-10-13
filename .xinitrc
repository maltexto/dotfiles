#!/bin/sh
setxkbmap -model abnt2 -layout br -variant abnt2
pipewire &
devmon &
dbus-run-session bspwm
