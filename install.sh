#!/bin/bash

# Automatically exit this script if any command fails
set -e

dir=$(dirname $(readlink -f "$BASH_SOURCE"))

# Install dependencies
sudo apt install --assume-yes silversearcher-ag vim-gnome exuberant-ctags

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
vim +PlugClean! +PlugInstall! +qall

printf "\nIMPORTANT: You must now change the font in your terminal profile to a powerline font for the nice symbols in vim-airline to work.\n\n"
