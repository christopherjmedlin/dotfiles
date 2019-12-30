#!/bin/bash
kgbpath="/sys/class/leds/tpacpi::kbd_backlight/brightness"

if grep -q 0 $kgbpath
then echo "2" > $kgbpath
elif grep -q 2 $kgbpath
then echo "0" > $kgbpath
fi
