#!/bin/sh

setxkbmap -model abnt2 -layout br -variant abnt2

dbus-run-session &
exec bspwm
