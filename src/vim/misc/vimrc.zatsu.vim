scriptencoding utf-8

augroup zatsu
    autocmd!
augroup END

" --------------------------------
" vim-monster
" --------------------------------
let g:monster#completion#rcodetools#backend = 'async_rct_complete'

" --------------------------------
" javacomplete
" --------------------------------
autocmd zatsu FileType java setlocal omnifunc=javacomplete#Complete

" --------------------------------
" deoplete-clang2
" --------------------------------

let g:deoplete#sources#clang#executable = '/usr/bin/clang'


