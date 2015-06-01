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
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'd11wtq/ctrlp_bdelete.vim'
Plugin 'bogado/file-line'
Plugin 'rking/ag.vim'
Plugin 'PhilGrayson/php-explorer'

" Syntax
"--------
Plugin 'scrooloose/syntastic'
Plugin 'mitsuhiko/vim-jinja'
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
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'


" Git integration
"-----------------
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" UI / styling
"--------------
Plugin 'bling/vim-airline'
Plugin 'tomasr/molokai'
Plugin 'Yggdroot/indentLine'
Plugin 'edkolev/tmuxline.vim'
Plugin 'edkolev/promptline.vim'

" End vundle
call vundle#end()



""""""""""""
"  CONFIG  "
""""""""""""


" Indentation
"-------------

" Tabs = 4 spaces
set tabstop=4
" Delete 4 spaces with backspace
set softtabstop=4
" Use 4 spaces for (auto)indentation
set shiftwidth=4
" Convert tabs to spaces
set expandtab
" Automatically indent new lines to match the one above
set autoindent
" Make backspace work properly (e.g. traverse line breaks)
set backspace=indent,eol,start


" Search
"--------

" Highlight all matches for a search term
set hlsearch
" Make search case-insensitive
set ignorecase
" Search as you type
set incsearch


" Syntax
"--------

" Turn on syntax highlighting
syntax on
" Enable filetype specific plugins and auto indentation
filetype plugin indent on
" Display whitespace
set list
" Highlight tabs and trailing spaces
set listchars=tab:\|·,trail:`
" Set the colour for highlighted stuff
highlight SpecialKey ctermfg=darkgreen
" Remove trailing spaces when saving a buffer
autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")
" Use htmljinja plugin to syntax highlight both HTML and twig in .twig files
autocmd BufRead,BufNewFile *.twig set filetype=htmljinja
" When a bracket is inserted, briefly jump to the matching one
set showmatch
" Extended % matching (if/else, XML tags, etc as well as standard brackets)
runtime macros/matchit.vim


" CtrlP
"-------

" Use ag for faster indexing
let g:ctrlp_user_command = 'ag %s --ignore-case --skip-vcs-ignores --hidden --nocolor --nogroup
    \ --ignore ".git/"
    \ --ignore "build/"
    \ --ignore "node_modules"
    \ --ignore "\.sw[a-z]"
    \ -g ""'
" Use the faster ctrlp-py-matcher to speed up matching
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" Open new files created by CtrlP in the current window
let g:ctrlp_open_new_file='r'
" Open multiple files opened by CtrlP as hidden buffers
let g:ctrlp_open_multiple_files='i'
" Only update match window after typing has stopped for 100ms
let g:ctrlp_lazy_update=100
" Initialise the CtrlP delete plugin
if (!empty(glob("~/.vim/bundle/ctrlp_bdelete.vim")))
    call ctrlp_bdelete#init()
endif

" Key mapping
"-------------

" Hide search highlighting with \/
nnoremap <silent> <Leader>/ :nohlsearch<CR>
" Disable arrow keys (except in insert mode) - use h,j,k,l
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" Shortcut for Tabularize
map <F2> :Tabularize /
" Toggle paste mode on/off with F3
set pastetoggle=<F3>
" Map PHP Explorer GoTo to F4
map <F4> \gt
" Easy window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Command-T muscle memory for CtrlP
nmap <Leader>t <C-p>
" Open CtrlP in find buffer mode with \b
nmap <Leader>b :CtrlPBuffer<CR>


" UI / styling
"--------------

" Use 256 colours for colorschemes
set t_Co=256
" Use molokai colorscheme
if (!empty(glob("~/.vim/bundle/molokai")))
    let g:molokai_original=1
    let g:rehash256=1
    colorscheme molokai
endif
" Use luna theme rather than molokai for vim-airline
let g:airline_theme='luna'
" Use powerline font for nice VCS symbols for vim-airline
let g:airline_powerline_fonts=1
" Automatically change the screen title
set title
" Show line numbers
set number
" Show the current cursor position in the status line
set ruler
" Always show the status line
set laststatus=2
" Keep the cursor vertically centered, where possible
set scrolloff=999
" Draw a vertical line at 120 characters
highlight ColorColumn ctermbg=DarkGrey
set colorcolumn=120
" CtrlP match window settings (order top-to-bottom, max height 999 lines)
let g:ctrlp_match_window='order:ttb,max:999'
" Highlight each leading space in indentation
let g:indentLine_leadingSpaceChar='·'
let g:indentLine_leadingSpaceEnabled=1
" Set the indentation highlight colour (subtle grey against molokai background)
let g:indentLine_color_term=237

" Promptline config
let g:promptline_theme='airline'
let g:promptline_preset={
    \'a': [ '%*' ],
    \'b': [ promptline#slices#host({'only_if_ssh':1}), promptline#slices#user() ],
    \'c': [ promptline#slices#cwd() ],
    \'x': [ promptline#slices#vcs_branch() ],
    \'y': [ promptline#slices#git_status() ]
\}


" Other
"-------

" Set persistent undo (so undo history is saved even when buffers are closed)
set undodir=~/.vim-undo
set undofile

" Show possible completions in command mode with <TAB>
set wildmenu
" List all possible completions, completing to the longest common string
" first, and then each full match on subsequent presses of <TAB>
set wildmode=list:longest,full

" Hide (rather than close) abandoned buffers, to preserve undos and remember unsaved changes
set hidden

" Write swapfile 2 seconds after typing ends (for faster realtime gitgutter)
set updatetime=2000


" Functions
"-----------

" http://technotales.wordpress.com/2010/03/31/preserve-a-vim-function-that-keeps-your-state/
function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
