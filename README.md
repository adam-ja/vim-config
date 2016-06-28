# vim-config

My vim settings and plugins

## Installation

The included `install.sh` script will install/update any packages you need (assuming you're on a Debian-based system), create any required directories, and install/update the vim plugins specified in the `vimrc` file.

**IMPORTANT**: The `install.sh` script will remove any vim plugins you already have installed if they are not specified to be managed by `Vundle` in the `vimrc` file
```sh
git clone https://github.com/adam-ja/vim-config.git ~/.vim
~/.vim/install.sh
```
## vimrc

Pretty much everything in the `vimrc` file is commented with at least a brief explanation. For more details, try vim help (`:help whatever`) or Google.

## Plugins

All vim plugins are managed by [Vundle](https://github.com/gmarik/Vundle.vim), including Vundle itself. Plugins are specified in the `vimrc` file. When inside vim, `:PluginInstall` will install any specified plugins that are missing, `:PluginInstall` will install new plugins and update existing ones, and `:PluginUpdate` will just update those that are already installed. For more information, go [here](https://github.com/gmarik/Vundle.vim) or see the vimdoc (`:help vundle`).

Below is a list of all the plugins included in this repo's `vimrc` file, with a brief description. To find out more, click through to the plugin's gitub page or, once you've installed the plugin, try `:help plugin-name`.

#### Files & Buffers

- [CtrlP](https://github.com/ctrlpvim/ctrlp.vim) is a powerful fuzzy finder for finding and opening files and buffers in a project.
- [ctrlp-py-matcher](https://github.com/FelikZ/ctrlp-py-matcher) is a faster CtrlP matcher implemented in Python
- [ctrlp-modified.vim](https://github.com/jasoncodes/ctrlp-modified.vim) is an extension to CtrlP that shows files edited in the current Git branch/since the last commit.
- [ctrlp-funky](https://github.com/tacahiroy/ctrlp-funky) is a CtrlP extension that acts like a simple function navigator.
- [file-line](https://github.com/bogado/file-line) allows you to open files in vim on a specific line with `vim path/to/file:lineNo`
- [ag.vim](https://github.com/rking/ag.vim) integrates [the_silver_searcher](https://github.com/ggreer/the_silver_searcher) into vim.
- [PHP Explorer](https://github.com/PhilGrayson/php-explorer) lets you jump to a PHP class or function declaration from use statements, parameter typehints, and method calls under the cursor with `<Leader>gt` (mapped to `<F4>` in this repo's `vimrc`).
- [NERDTree](https://github.com/scrooloose/nerdtree) allows you to explore your filesystem as a tree from within vim, and to open files and directories.

#### Syntax

- [Syntastic](https://github.com/scrooloose/syntastic) is a syntax checker that notifies of syntax errors on file save.
- [vim-jinja](https://github.com/mitsuhiko/vim-jinja) provides syntax highlighting for HTML and Jinja (which Twig is based on).
- [vim-less](https://github.com/groenewege/vim-less) provides syntax highlighting for LESS.
- [vim-puppet](https://github.com/rodjek/vim-puppet) provides syntax highlighting for Puppet.

#### Utilities

- [emmet-vim](https://github.com/mattn/emmet-vim) expands abbreviations to make writing HTML faster.
- [SearchComplete](https://github.com/vim-scripts/SearchComplete) lets you tab-complete words when searching (`/`).
- [vim-snipmate](https://github.com/garbas/vim-snipmate) expands snippets of text to pre-defined code templates.
- [vim-snippets](https://github.com/honza/vim-snippets) provides common snippets for various programming languages for use with snipmate.
- [CamelCaseMotion](https://github.com/bkad/CamelCaseMotion) provides `,w`, `,b`, and `,e` motions to move within CamelCase and underscore_separated strings in the same way as the default `w`, `b`, and `e` motions move between words.
- [tabular](https://github.com/godlygeek/tabular) automatically aligns text (e.g. aligning equals) on multiple lines. This repo's `vimrc` maps the shortcut `<F2>`, so `<F2>=` will align the `=` on all surrounding lines.
- [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) is a port of Sublime Text's multiple selection feature, allowing you to select and edit multiple instances of a word at once.
- [vim-repeat](https://github.com/tpope/vim-repeat) extends the repeat command (`.`) beyond native Vim commands to supported plugins.
- [vim-surround](https://github.com/tpope/vim-surround) enables shortcuts to add, delete and edit pairs of surroundings (brackets, quotes, tags) around text.
- [vim-speeddating](https://github.com/tpope/vim-speeddating) fixes Vim increment (`<C-A>`) and decrement (`<C-X>`) commands for dates, times, etc.
- [vim-abolish](https://github.com/tpope/vim-abolish) lets you easily substitute or configure abbreviations for all case variants and more. It also provides shortcuts for switching text between camelCase, MixedCase, etc.
- [vim-commentary](https://github.com/tpope/vim-commentary) provides shortcuts to comment and uncomment lines and blocks of text.
- [auto-pairs](https://github.com/jiangmiao/auto-pairs) inserts and deletes brackets and quotes in pairs.
- [localvimrc](https://github.com/embear/vim-localvimrc) searches for and sources local vimrc files (`.lvimrc`) from the directory of the current file up to the root directory, to allow for project-level overrides.

#### Git integration

- [vim-fugitive](https://github.com/tpope/vim-fugitive) provides commands like `:Gblame` to `git blame` the current file, `:Gdiff` to show changes, and `:Gmove` to `git mv` the file and rename the buffer.
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter) indicates git diff status (lines added, modified, or deleted) in the gutter (next to line numbers).

#### UI / styling

- [vim-airline](https://github.com/vim-airline/vim-airline/) provides a nice, customisable status line. It also integrates with `vim-gitgutter` to show the current branch name and a count of modified, added, and removed lines.
- [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes) is the official theme repo for vim-airline.
- [molokai](https://github.com/tomasr/molokai) is (in my opinion) a nice colour scheme, and there's a matching `vim-airline` theme.
- [indentLine](https://github.com/Yggdroot/indentLine) highlights indentation for code indented with spaces.
- [tmuxline.vim](https://github.com/edkolev/tmuxline.vim) generates tmux statusline config to match `vim-airline`.
- [promptline.vim](https://github.com/edkolev/promptline.vim) generates shell prompt config to match `vim-airline`.
