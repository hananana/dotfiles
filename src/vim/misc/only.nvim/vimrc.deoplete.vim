scriptencoding utf-8

augroup deoplete
    autocmd!
augroup END

let g:deoplete#enable_at_startup = 1 
let g:deoplete#auto_complete_delay = 0
let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_smart_case = 1

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()

function! s:check_back_space() abort 
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" --------------------------------
" deoplete-omnisharp
" --------------------------------
let g:deoplete_omnisharp_exe_path = get(g:, "deoplete_omnisharp_exe_path", '~/.dotfiles/src/vim/plugged/deoplete-omnisharp/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe')
