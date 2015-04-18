" Disable Vi compatibility to enable more powerful vim features
set nocompatible

""""""""""""
"  VUNDLE  "
""""""""""""

" Temporarily disable filetype detection - required for vundle
filetype off

" Include vundle in the runtime path
set rtp+=~/.vim/bundle/Vundle.vim

" Initialise vundle to install plugins to ~/.vim/bundle
call vundle#begin('~/.vim/bundle')

" Let vundle manage itself (required)
Plugin 'gmarik/Vundle.vim'

" Files & Buffers
"-----------------
Plugin 'kien/ctrlp.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'bogado/file-line'
Plugin 'rking/ag.vim'
Plugin 'PhilGrayson/php-explorer'

" Syntax
"--------
Plugin 'scrooloose/syntastic'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'groenewege/vim-less'
Plugin 'rodjek/vim-puppet'

" Utilities
"-----------
Plugin 'mattn/emmet-vim'
Plugin 'vim-scripts/SearchComplete'
Plugin 'MarcWeber/vim-addon-mw-utils' " Required for vim-snipmate
Plugin 'tomtom/tlib_vim' " Required for vim-snipmate
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'bkad/CamelCaseMotion'
Plugin 'godlygeek/tabular'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'

" Git integration
"-----------------
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Colour schemes
"----------------
Plugin 'tomasr/molokai'

" End vundle
call vundle#end()



""""""""""""
"  CONFIG  "
""""""""""""

" Hides buffers instead of closing them
" This means undos are preserved when switching between buffers
" Also, vim won't try to prompt you to save or undo changes to the current buffer when switching to another
set hidden

" Tabs are equivalent to 4 spaces
set tabstop=4

" Make backspace delete 4 spaces, not just one at a time
set softtabstop=4

" Automatic indentation uses tabs equivalent to 4 spaces
set shiftwidth=4

" Convert tabs to spaces
set expandtab

" Automatically indent new lines to match the one above
set autoindent

" Smarter indentation - e.g. indent further inside a loop or function
set smartindent

" Make backspace work properly (e.g. traverse line breaks)
set backspace=indent,eol,start

" Highlight all matches for a search term
set hlsearch

" Make search case-insensitive
set ignorecase

" Start searching as soon as the first character is input after /
set incsearch

" Display whitespace
set list

" Highlight tabs and trailing spaces
set listchars=tab:\|·,trail:`

" BufExplorer has a bug that sets list off. This fixes it
autocmd BufEnter,BufNew,BufRead,BufNewFile * set list

" Set the colour for highlighted stuff
highlight SpecialKey ctermfg=darkgreen

" Remove trailing spaces when saving a buffer
autocmd BufWritePre * :%s/\s\+$//e

" Use htmljinja plugin to syntax highlight both HTML and twig in .twig files
au BufRead,BufNewFile *.twig set filetype=htmljinja

" Make Command-T find more files (default is 10000)
let g:CommandTMaxFiles=25000

" Shortcut for refreshing Command-T's file list
nmap <F5> :CommandTFlush<CR>

" Moving to the next/previous search match puts it in the middle of the screen
nmap n nzz
nmap N Nzz

" Shortcut for Tabularize
map <F2> :Tabularize /

" Disable arrow keys (except in insert mode) - use h,j,k,l
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Set persistent undo (so undo history is saved even when buffers are closed)
set undodir=~/.vim-undo
set undofile
set undolevels=1000  " Maximum number of changes that can be undone
set undoreload=10000 " Maximum number of lines to save for undo on a buffer reload

" Always show the status line (current file etc)
set ls=2

" When a bracket is inserted, briefly jump to the matching one
set showmatch

" Automatically change the screen title
set title

" Show line numbers
set number

" Show the current cursor position in the status line
set ruler

" Show possible completions of commands, file names etc in status line
set wildmenu

" Turn on syntax highlighting
syntax on

" Enable filetype specific plugins and auto indentation
filetype plugin indent on

" Toggle paste mode on/off with F3
set pastetoggle=<F3>

" Map PHP Explorer GoTo to F4
map <F4> \gt

" Use 256 colours for colorschemes
set t_Co=256

" Use molokai colorscheme
let g:molokai_original=1
let g:rehash256=1
colorscheme molokai

" Use luna theme rather than molokai for vim-airline
let g:airline_theme='luna'
