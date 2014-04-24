" Pathogen
execute pathogen#infect()
execute pathogen#helptags()

" Get rid of Vi compatibility to enable a load of vim features
set nocompatible

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
nmap <F2> :Tabularize /

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
