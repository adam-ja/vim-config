""""""""""""
" Commands "
""""""""""""

" Add a preview to the :Files command
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Add a preview to the :Rg command
command! -bang -nargs=* Rg
  \ call fzf#vim#grep('rg --column --no-heading --line-number --color=always '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

""""""""""""""""
" Key Mappings "
""""""""""""""""

" Files under working directory
nmap <Leader>p :Files!<CR>

" Open buffers
nmap <Leader>b :Buffers!<CR>

" Rg within files under working directory
nmap <Leader>g :Rg!<Space>

" Modified files
nmap <Leader>m :GFiles!?<CR>

" Commits affecting current buffer
nmap <Leader>c :BCommits!<CR>

" All commits
nmap <Leader>C :Commits!<CR>
