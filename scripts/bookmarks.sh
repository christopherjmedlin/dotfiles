#!/bin/bash

url=$(cat $HOME/.config/surf/bookmarks | dmenu)
if ! [ -z "$url" ]
then
	surf $url
fi
