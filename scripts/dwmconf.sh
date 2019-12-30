#!/bin/bash

cd ~/suckless/dwm/
vim ~/suckless/dwm/config.h

echo "Save changes? (y/n)"
read input
if [[ "$input" == "y" ]]
then
	make
	sudo make install
fi

