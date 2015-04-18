#!/bin/bash

# Automatically exit this script if any command fails
set -e

echo "Starting vim setup..."

# Install dependencies
echo "Installing dependencies..."
sudo apt-get install silversearcher-ag vim-gnome git

# Make directories for vim plugins and persistent undo
echo "Creating required directories..."
mkdir -p ~/.vim/bundle ~/vim-undo

# Clone Vundle to manage plugins
if [ ! -e ~/.vim/bundle/Vundle.vim ]
then
    echo "Cloning vundle..."
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Remove any plugins not specified with Vundle in vimrc
echo "Removing unmanaged plugins..."
vim +PluginClean! +qall

# Install/Update all plugins specified with Vundle in vimrc
echo "Installing/updating managed plugins..."
vim +PluginInstall! +qall

echo "Finished vim setup."
