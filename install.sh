#!/bin/bash

# Automatically exit this script if any command fails
set -e

dir=$(dirname $(readlink -f "$BASH_SOURCE"))

# Install dependencies
sudo apt-get install silversearcher-ag vim-gnome

# Install Powerline fonts for nice VCS symbols in vim-airline
powerline_dir=${HOME}/powerline-fonts
if [ -e $powerline_dir/install.sh ]
then
    (cd $powerline_dir; git pull)
else
    git clone https://github.com/powerline/fonts.git $powerline_dir
fi
$powerline_dir/install.sh

# Make directories for vim plugins and persistent undo
mkdir -p ${HOME}/.vim/bundle ${HOME}/vim-undo

vundle_path=$dir/bundle/Vundle.vim
# Clone Vundle to manage plugins
if [ ! -e $vundle_path ]
then
    git clone https://github.com/gmarik/Vundle.vim.git $vundle_path
fi

# Install/Update all plugins specified with Vundle in vimrc, and remove any not specified
vim +PluginClean! +PluginInstall! +qall

printf "\nIMPORTANT: You must now change the font in your terminal profile to a powerline font for the nice symbols in vim-airline to work.\n\n"
