#!/bin/bash

# enter directory of script
cd "${0%/*}"

ln -Ts "$(pwd)/.config/vim" "$HOME/.config/vim"
mkdir -p $HOME/.config/mpd
mkdir -p $HOME/.config/ncmpcpp
ln -s "$(pwd)/.config/mpd/mpd.conf" "$HOME/.config/mpd/mpd.conf" 
ln -s "$(pwd)/.config/ncmpcpp/config" "$HOME/.config/ncmpcpp/config" 
ln -s "$(pwd)/.zshrc" "$HOME/.zshrc" 
ln -s "$(pwd)/.zprofile" "$HOME/.zprofile" 
ln -s "$(pwd)/.xinitrc" "$HOME/.xinitrc" 

mkdir -p $HOME/bin
cp "$(pwd)/scripts/*" $HOME/bin
