augroup completion
    autocmd!
augroup END
" --------------------------------
" YouCompleteMe
" --------------------------------
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:ycm_use_ultisnips_completer = 1
let g:ycm_show_diagnostics_ui = 0

autocmd completion FileType c,cpp,objcpp,cs nnoremap <Leader>yt :YcmCompleter GetType<CR>
autocmd completion FileType cs nnoremap <Leader>yr :YcmCompleter ReloadSolution<CR>

" --------------------------------
" javacomplete2
" --------------------------------
autocmd completion FileType java setlocal omnifunc=javacomplete#Complete

" --------------------------------
" vim-monster
" --------------------------------
let g:monster#completion#rcodetools#backend = "async_rct_complete"
