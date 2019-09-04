" Extensions to install
let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-docker',
    \ 'coc-highlight',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-phpls',
    \ 'coc-sh',
    \ 'coc-tsserver',
    \ 'coc-vetur',
    \ 'coc-yaml',
    \]

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Show documentation in preview window
nnoremap <silent> <Leader>d :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
