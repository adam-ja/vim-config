# vim-config

My vimrc settings and plugins

Thanks to Drew Neil for getting me started with [this vimcast](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)

## Installation

1. Make sure ruby and vim-gnome are installed. vim-gnome installs gvim (at least on Ubuntu) which enables copying to the system buffer (highlight a block of text, then type "+y and it will be copied to the system clipboard so you can paste it into other vim instances or other applications), and also provides the ruby support required for the Command-T plugin.

        sudo apt-get install ruby-full vim-gnome

2. Clone this repo into ~/.vim

        git clone https://github.com/adam-ja/vim-config.git ~/.vim

3. Create a symlink for the vimrc (vim always expects the vimrc to be in the home directory)

        ln -s ~/.vim/vimrc ~/.vimrc

4. Initialise the plugin submodules

        cd ~/.vim
        git submodule update --init

## vimrc

For the persistent undo to work, the ~/.vim-undo directory must be created

## Plugins

Where possible, plugins are managed as git submodules, so they can be easily updated using

    git submodule foreach git pull --ff-only origin master

New plugins can be installed using

    git submodule add http://github.com/someuser/someplugin.git ~/.vim/bundle/someplugin

### Pathogen

In addition to being git submodules, all plugins are installed as bundles and managed using [Pathogen](https://github.com/tpope/vim-pathogen), including Pathogen itself. A symlink is used in the autoload directory to ensure Pathogen loads with vim and brings in all the other plugins it manages.

### BufExplorer

[BufExplorer](https://github.com/vim-scripts/bufexplorer.zip) provides quick and easy switching between open buffers.

### file-line

[file-line](https://github.com/bogado/file-line) allows you to open files in vim on a specific line with

    vim path/to/file:lineNo

### SearchComplete

[SearchComplete](https://github.com/vim-scripts/SearchComplete) lets you tab-complete words in a search ( / ).

### emmet

[emmet](https://github.com/mattn/emmet-vim) expands abbreviations to make writing HTML faster.

### snipmate

[snipmate](https://github.com/msanders/snipmate.vim) allows you to insert snippets of text by typing some trigger word followed by tab.

### Command-T

[Command-T](https://github.com/wincent/Command-T) provides an extremely fast way to open files simply by typing characters that appear in their paths.

It requires ruby and vim with ruby support to be installed.

Whenever this plugin is installed or updated, it must be built using

    cd ~/.vim/bundle/command-t/ruby/command-t
    ruby extconf.rb
    make

### vim-jinja

[vim-jinja](https://github.com/mitsuhiko/vim-jinja) enables syntax highlighting for Jinja (or Twig) and HTML in the same file

Adding the following to the vimrc uses this syntax highlighting on .twig files

    au BufRead,BufNewFile *.twig set filetype=htmljinja

### tabular

[tabular](https://github.com/godlygeek/tabular) automatically aligns text (e.g. aligning equals)

To align equals, simply place the cursor somewhere in the block of text you want to align and use the command:

    :Tabularize /=

### VIM-LESS

[VIM-LESS](https://github.com/groenewege/vim-less) is a syntax highlighter for LESS, also with indenting and autocompletion

### puppet-syntax-vim

[puppet-syntax-vim](https://github.com/puppetlabs/puppet-syntax-vim) adds syntax highlighting for files used by Puppet

### CamelCaseMotion

[CamelCaseMotion](https://github.com/bkad/CamelCaseMotion) makes it possible to navigate camel case and underscore-separated strings. Shortcuts `,w`, `,b`, and `,e` work in the same way as the standard `w`, `b`, and `e`, but where the standard shortcuts would treat SomeLongString or some_long_string as a single word, the camel case motion variants allow you to move between "some", "long" and "string". These shortcuts can also be used in conjunction with `c` and `d` to change/delete up to the next segment of the string.
