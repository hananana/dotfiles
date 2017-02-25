augroup completion
    autocmd!
augroup END

" --------------------------------
" YouCompleteMe
" --------------------------------
let g:UltiSnipsExpandTrigger='<c-k>'
let g:UltiSnipsJumpForwardTrigger='<c-k>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
let g:UltiSnipsEditSplit='vertical'
let g:ycm_use_ultisnips_completer = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.dotfiles/ycm_extra_conf/global_ycm_extra_conf.py'
let g:ycm_extra_conf_vim_data = ['&filetype', 'expand(expand("<sfile>:p:h"))']

" --------------------------------
" vim-monster
" --------------------------------
let g:monster#completion#rcodetools#backend = 'async_rct_complete'

" --------------------------------
" javacomplete
" --------------------------------
autocmd completion FileType java setlocal omnifunc=javacomplete#Complete
let g:JavaComplete_UsePython3 = 1

" let g:JavaComplete_LibsPath = '~/Library/Android/sdk/platforms/android-24/android.jar'
" let g:JavaComplete_SourcesPath = '~/Library/Android/sdk/platforms/android-24'
