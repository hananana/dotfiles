augroup nerdtree
    autocmd!
augroup END

nmap <C-e> :NERDTreeToggle<CR>
autocmd nerdtree BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
