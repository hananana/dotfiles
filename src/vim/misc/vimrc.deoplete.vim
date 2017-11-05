scriptencoding utf-8

augroup deoplete
    autocmd!
augroup END

" --------------------------------
" deoplete.nvim
" --------------------------------
let g:deoplete#enable_at_startup = 1 
let g:deoplete#auto_complete_delay = 0
let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_smart_case = 1

" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"
" inoremap <silent> <CR> <C-r>=<SID>cr_func()<CR>
" function! s:cr_func() abort
"     return pumvisible() ? deoplete#close_popup() : "\<CR>"
" endfunction
