# vim-config

My vimrc settings and plugins

## Installation

1. Make sure ruby and vim-nox are installed (vim with ruby support is required for the Command-T plugin)

        sudo apt-get install ruby-full && vim-nox

2. Clone this repo into ~/.vim

3. Create a symlink for the vimrc (vim always expects the vimrc to be in the home directory)

        ln -s ~/.vim/vimrc ~/.vimrc

## Plugins

Where possible, plugins are managed as git submodules, so they can be easily updated using

    git submodule foreach git pull origin master

## Pathogen

In addition to being git submodules, all plugins are installed as bundles and managed using Pathogen (https://github.com/tpope/vim-pathogen), including Pathogen itself. A symlink is used in the autoload directory to ensure Pathogen loads with vim and brings in all the other plugins it manages.
