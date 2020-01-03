#!/bin/bash

# enter directory of script
cd "${0%/*}"

ln -Ts "$(pwd)/.config/vim" "$HOME/.config/vim"
mkdir -p $HOME/.config/surf
touch $HOME/.config/surf/bookmarks
mkdir -p $HOME/.config/mpd
mkdir -p $HOME/.config/ncmpcpp
ln -s "$(pwd)/.config/mpd/mpd.conf" "$HOME/.config/mpd/mpd.conf" 
ln -s "$(pwd)/.config/ncmpcpp/config" "$HOME/.config/ncmpcpp/config" 
ln -s "$(pwd)/.zshrc" "$HOME/.zshrc" 
ln -s "$(pwd)/.zprofile" "$HOME/.zprofile" 
ln -s "$(pwd)/.xinitrc" "$HOME/.xinitrc" 

mkdir -p $HOME/bin
cp scripts/* $HOME/bin

# mutt wizard
git clone https://github.com/LukeSmithxyz/mutt-wizard /tmp/mutt-wizard
cd /tmp/mutt-wizard
sudo make install
