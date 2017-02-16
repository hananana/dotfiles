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
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.dotfiles/ycm_extra_conf/global_ycm_extra_conf.py'
let g:ycm_extra_conf_vim_data = ['&filetype']
let g:EclimCompletionMethod = 'omnifunc'

autocmd completion FileType c,cpp,objcpp,cs nnoremap <Leader>yt :YcmCompleter GetType<CR>
autocmd completion FileType cs nnoremap <Leader>yr :YcmCompleter ReloadSolution<CR>

" --------------------------------
" vim-monster
" --------------------------------
let g:monster#completion#rcodetools#backend = "async_rct_complete"
