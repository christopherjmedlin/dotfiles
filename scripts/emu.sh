#!/bin/bash

DMENU_ARGS="-m 0 -fn monospace:size=9 -nb #000000 -nf #eeeeee -sb #000000 -sf #AA0000"
platform=$(ls ~/games/ | dmenu $DMENU_ARGS)
rom=$(ls "/home/$USER/games/$platform" | dmenu $DMENU_ARGS)
emulator=""
arg=""

case $platform in
"n64")
	emulator="mupen64plus"
	arg="--fullscreen"
	;;
"psx")
	emulator="pcsxr"
	arg="-cdfile"
	;;
esac 

$emulator $arg "/home/$USER/games/$platform/$rom"
