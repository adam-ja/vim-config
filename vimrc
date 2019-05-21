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

" Syntax
"--------
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'

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
Plug 'janko/vim-test'
Plug 'kburdett/vim-nuuid'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'arp242/auto_mkdir2.vim'

" Git integration
"-----------------
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

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
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}

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
" Use 2 spaces instead of 4 for certain filetypes
autocmd Filetype puppet,ruby,yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2


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
" Stop vue syntax highlighting from breaking
" (https://github.com/posva/vim-vue#my-syntax-highlighting-stops-working-randomly)
autocmd FileType vue syntax sync fromstart
" When a bracket is inserted, briefly jump to the matching one
set showmatch
" Extended % matching (if/else, XML tags, etc as well as standard brackets)
runtime macros/matchit.vim
" Open error window when ale detects errors
let g:ale_open_list = 1
" Show 5 errors at a time in the error window (default is 10)
let g:ale_list_window_size = 5
" Wait a second for me to finish typing before linting
let g:ale_lint_delay = 1000
" Set phpcs standard for ale to use
let g:ale_php_phpcs_standard = 'psr2'
" Set phpstan to level 5 for ale
let g:ale_php_phpstan_level = 5
" Show ale info in statusline
let g:airline#extensions#ale#enabled = 1
" Show linter at beginning of message
let g:ale_echo_msg_format = '[%linter%] %s'

" Make ale error/warning gutter symbols prettier
let g:ale_sign_error = '😠'
let g:ale_sign_warning = '😒'


" CtrlP
"-------

" Use ripgrep for faster indexing
let g:ctrlp_user_command = 'rg %s --files --no-ignore-vcs --hidden --color=never --glob ""'
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

" Make <Space> the <Leader> key instead of the default \
let mapleader = ' '

" Hide search highlighting
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
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
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
" Move to the previous ale warning/error
nmap <silent> <Leader>j <Plug>(ale_previous_wrap)
" Move to the next ale warning/error
nmap <silent> <Leader>k <Plug>(ale_next_wrap)
" Disable default nuuid plugin mappings
let g:nuuid_no_mappings = 1

" Write/quit even if I accidentally hold down shift on :w/:q/:wq
command! -bang W :w<bang>
command! -bang Q :q<bang>
command! -bang WQ :wq<bang>
command! -bang Wq :wq<bang>

" Phpactor mappings
" Include use statement
autocmd FileType php nmap <buffer> <Leader>u :call phpactor#UseAdd()<CR>
" Invoke the context menu
autocmd FileType php nmap <buffer> <Leader>mm :call phpactor#ContextMenu()<CR>
" Invoke the navigation menu
autocmd FileType php nmap <buffer> <Leader>nn :call phpactor#Navigate()<CR>
" Goto definition of class or class member under the cursor
autocmd FileType php nmap <buffer> <C-]> :call phpactor#GotoDefinition()<CR>
" Show brief information about the symbol under the cursor
autocmd FileType php nmap <buffer> <Leader>K :call phpactor#Hover()<CR>

" vim-test mappings
" Run all tests
nmap <Leader>ta :TestSuite<CR>
" Run all tests in current test file
nmap <Leader>tf :TestFile<CR>
" Run single test closest to the cursor
nmap <Leader>tt :TestNearest<CR>
" Re-run the last run test
nmap <Leader>tl :TestLast<CR>
" Go to the last run test
nmap <Leader>tg :TestVisit<CR>

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

" Attempt to improve performance
set lazyredraw

" Set persistent undo (so undo history is saved even when buffers are closed)
set undodir=~/.vim-undo
set undofile

" Hide (rather than close) abandoned buffers, to preserve undos and remember unsaved changes
set hidden

" Show possible completions in command mode with <TAB>
set wildmenu

" List all possible completions, completing to the longest common string
" first, and then each full match on subsequent presses of <TAB>
set wildmode=list:longest,full

" Make the decisions given when asked before sourcing local vimrc files
" persistent over multiple vim runs and instances (only if the answer was given
" in upper case (Y/N/A))
let g:localvimrc_persistent=1

" Disable lvimrc sandbox so that lvimrc files can include potentially risky
" commands. This is safe so long as you trust the source of any repos with a
" lvimrc file.
let g:localvimrc_sandbox = 0

" Use phpactor for PHP omni-completion
autocmd FileType php setlocal omnifunc=phpactor#Complete

" Run tests with vim-test in a split window inside vim instead of in the
" terminal
let test#strategy = 'vimterminal'


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
