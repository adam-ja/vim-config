#!/bin/bash

# Automatically exit this script if any command fails
set -e

dir=$(dirname $(readlink -f "$BASH_SOURCE"))

# Install dependencies
sudo apt install --assume-yes vim-gnome

# Install Powerline fonts for nice VCS symbols in vim-airline
powerline_dir=${HOME}/powerline-fonts
if [ -e $powerline_dir/install.sh ]
then
    (cd $powerline_dir; git pull)
else
    git clone https://github.com/powerline/fonts.git $powerline_dir
fi
$powerline_dir/install.sh

# Make directory for vim persistent undo
mkdir -p ${HOME}/vim-undo

# Install/Update all plugins specified with vim-plug in vimrc, and remove any not specified
vim - +PlugUpgrade +PlugClean! +PlugUpdate! +qall

printf "\e[38;5;202mIMPORTANT: You must now change the font in your terminal profile to a powerline font for the nice symbols in vim-airline to work.\e[0m\n"
