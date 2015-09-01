abbreviate tl - [ ]

setlocal foldmethod=indent

nnoremap <buffer> <Leader><Leader> :call ToggleCheckbox()<CR>
vnoremap <buffer> <Leader><Leader> :call ToggleCheckbox()<CR>
    
function! ToggleCheckbox()
    let l:line = getline('.')
    if l:line =~ '\-\s\[\s\]'
        let l:result = substitute(l:line, '-\s\[\s\]', '- [x]', ''). ' [' . strftime("%Y/%m/%d (%a) %H:%M") . ']'
        call setline('.', l:result)
    elseif l:line =~ '\-\s\[x\]'
        let l:result = substitute(substitute(l:line,'-\s\[x\]', '- [ ]', ''), '\s\[\d\{4}.\+]$', '','')
        call setline('.', l:result)
    end
endfunction

