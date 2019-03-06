# vim-config

My vim settings and plugins

## Installation

The included `install.sh` script will install/update any packages you need (assuming you're on a Debian-based system), create any required directories, and install/update the vim plugins specified in the `vimrc` file.

**IMPORTANT**: The `install.sh` script will remove any vim plugins you already have installed if they are not specified to be managed by `vim-plug` in the `vimrc` file
```sh
git clone https://github.com/adam-ja/vim-config.git ~/.vim
~/.vim/install.sh
```
## vimrc

Pretty much everything in the `vimrc` file is commented with at least a brief explanation. For more details, try vim help (`:help whatever`) or Google.

## Plugins

All vim plugins are managed by [vim-plug](https://github.com/junegunn/vim-plug). Plugins are specified in the `vimrc` file. When inside vim, `:PlugInstall` will install any specified plugins that are missing, `:PlugInstall` will install new plugins and update existing ones, and `:PlugUpdate` will just update those that are already installed. For more information, go [here](https://github.com/junegunn/vim-plug).

To find out more about a specific plugin, search for it on github using the name passed to `Plug` or, once you've installed the plugin, try `:help plugin-name`.
