#!/bin/bash

DMENU_ARGS="-m 0 -fn monospace:size=9 -nb #000000 -nf #eeeeee -sb #000000 -sf #AA0000"
url=$(cat $HOME/.config/surf/bookmarks | dmenu $DMENU_ARGS)
if ! [ -z "$url" ]
then
	surf $url
fi
