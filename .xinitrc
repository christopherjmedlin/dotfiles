#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# This is for an issue with Android Studio.
# If you run into any issues with Java apps, consider removing this line
export _JAVA_AWT_WM_NONREPARENTING=1

RED="^c#AA0000^"
WHITE="^c#eeeeee^"

while true; do
	xsetroot -name "$WHITE ♪ $(mpc | head -n 1)$RED λ $WHITE$(date)"
	sleep 3s
done &

exec ~/bin/startdwm.sh
# invoke global X session script
. /etc/X11/Xsession
