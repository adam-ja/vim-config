" ALE
"-----

" Set phpcs standard
let g:ale_php_phpcs_standard = 'psr2'
" Set phpstan to level 5
let g:ale_php_phpstan_level = 5

" PHPActor
"----------

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

" Use phpactor for PHP omni-completion
autocmd FileType php setlocal omnifunc=phpactor#Complete
