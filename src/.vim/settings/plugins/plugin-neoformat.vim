augroup neoformat
    autocmd!
augroup END

let g:neoformat_enabled_cs = ['uncrustify']
let g:neoformat_cs_uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'args': ['-q', '-c $HOME/.dotfiles/src/.uncrustifyconfig'],
            \ 'stdin': 1, 
            \}

" autocmd functions FileType cs nnoremap <Leader>f :Neoformat<CR>
