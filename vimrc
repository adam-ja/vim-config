" Disable Vi compatibility to enable more powerful vim features
set nocompatible

""""""""""""
"  VIM-PLUG  "
""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Initialise vim-plug to install plugins to ~/.vim/plugged
call plug#begin('~/.vim/plugged')

" Files & Buffers
"-----------------
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'jasoncodes/ctrlp-modified.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'bogado/file-line'

" Syntax
"--------
Plug 'scrooloose/syntastic'
Plug 'mitsuhiko/vim-jinja'
Plug 'groenewege/vim-less'
Plug 'rodjek/vim-puppet'

" Utilities
"-----------
Plug 'vim-scripts/SearchComplete'
Plug 'MarcWeber/vim-addon-mw-utils' " Required for vim-snipmate
Plug 'tomtom/tlib_vim' " Required for vim-snipmate
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'bkad/CamelCaseMotion'
Plug 'godlygeek/tabular'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'embear/vim-localvimrc'
Plug 'ludovicchabant/vim-gutentags'

" Git integration
"-----------------
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" UI / styling
"--------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
Plug 'edkolev/tmuxline.vim'
Plug 'ap/vim-css-color'
Plug 'RRethy/vim-illuminate'

" Language specifics
"--------------------
" HTML
" -----
Plug 'mattn/emmet-vim'
" PHP
" ----
Plug 'beanworks/vim-phpfmt'

" End vim-plug
call plug#end()



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
" Use 2 spaces instead of 4 for puppet and ruby
autocmd Filetype puppet setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2


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
" Syntax highlight SQL within PHP
let php_sql_query=1
" Syntax highlight HTML within PHP
let php_htmlInStrings=1
" Configure syntax checkers for syntastic to use for PHP files
let g:syntastic_php_checkers=['php','phpcs','phpmd','phpstan']
" Automatically open and close the error window depending on whether syntastic
" detects errors
let g:syntastic_auto_loc_list=1
" Set syntastic error window height in lines (defaults to 10)
let g:syntastic_loc_list_height=5
" Run syntax checks when files are first opened as well as when they're saved
let g:syntastic_check_on_open=1
" Run all checkers that apply to a file and aggregate and display all errors,
" rather than stopping the first time a checker finds any errors
let g:syntastic_aggregate_errors=1
" Find and use a config file for phpstan
autocmd FileType php let b:syntastic_php_phpstan_args =
    \ get(g:, 'syntastic_php_phpstan_args', '') .
    \ '-l 5' .
    \ FindConfig('-c', 'phpstan.neon', expand('<afile>:p:h', 1))


" CtrlP
"-------

" Use ag for faster indexing
let g:ctrlp_user_command = 'ag %s --ignore-case --hidden --skip-vcs-ignore --nocolor --nogroup -g ""'
" Use the faster ctrlp-py-matcher to speed up matching
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" Open new files created by CtrlP in the current window
let g:ctrlp_open_new_file='r'
" Open multiple files opened by CtrlP as hidden buffers
let g:ctrlp_open_multiple_files='i'
" Only update match window after typing has stopped for 100ms
let g:ctrlp_lazy_update=100

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
" Easy window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Open CtrlP in find buffer mode with \b
nmap <Leader>b :CtrlPBuffer<CR>
" Open CtrlP showing files modified since the last commit
nmap <Leader>m :CtrlPModified<CR>
" Open CtrlP showing files modified on the current branch
nmap <Leader>M :CtrlPBranch<CR>
" Open CtrlP for functions in the current file
nmap <Leader>f :CtrlPFunky<CR>
" Open CtrlP for functions filtering by the word under the cursor
nmap <Leader>F :execute 'CtrlPFunky ' . expand('<cword>')<CR>
" Split arguments in a function call/definition onto separate lines
nnoremap <silent> <Leader>sp ^f(li<CR><Esc>:s/,/,\r/g<CR>f)i<CR><Esc>vib=/)<CR>==:nohlsearch<CR>
" Map CamelCaseMotion to ',w', ',b', ',e', and ',ge'
map ,w <Plug>CamelCaseMotion_w
map ,b <Plug>CamelCaseMotion_b
map ,e <Plug>CamelCaseMotion_e
map ,ge <Plug>CamelCaseMotion_ge
" Sort the paragraph around the current cursor position (above and below to the
" nearest blank line) in alphabetical order
nnoremap <Leader>al <C-v>apb:sort<CR>


" UI / styling
"--------------

" Use 256 colours for colorschemes
set t_Co=256
" Use molokai colorscheme
if (!empty(glob("~/.vim/plugged/molokai")))
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
" Highlight the line the cursor is currently on
set cursorline
" Draw a vertical line at 120 characters
highlight ColorColumn ctermbg=DarkGrey
set colorcolumn=120
" CtrlP match window settings (order top-to-bottom, max height 999 lines)
let g:ctrlp_match_window='order:ttb,max:999'


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

" Make the decisions given when asked before sourcing local vimrc files
" persistent over multiple vim runs and instances (only if the answer was given
" in upper case (Y/N/A))
let g:localvimrc_persistent=1


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

" Search for a config file starting from the current directory and working up
" https://github.com/vim-syntastic/syntastic#faqconfig
function! FindConfig(prefix, what, where)
    let cfg = findfile(a:what, escape(a:where, ' ') . ';')
    return cfg !=# '' ? ' ' . a:prefix . ' ' . shellescape(cfg) : ''
endfunction
