augroup netrw
    autocmd!
augroup END

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
let g:netrw_dirhistmax = 0

nnoremap <C-e> :call VexToggle(getcwd())<CR>

function! VexToggle(dir) abort
    if exists("t:vex_buf_nr")
        call VexClose()
    else
        call VexOpen(a:dir)
    endif
endfunction

function! VexOpen(dir) abort
    execute "Vexplore " . a:dir
    let t:vex_buf_nr = bufnr("%")
"     wincmd H
endfunction

function! VexClose() abort
    let cur_win_nr = winnr()
    let target_ner = ( cur_win_nr == 1 ? winnr("#") : cur_win_nr )
    1wincmd w
    close
    unlet t:vex_buf_nr

    execute (target_ner - 1 ) . "wincmd w"
endfunction


