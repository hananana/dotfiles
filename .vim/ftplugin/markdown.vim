abbreviate tl <space><space>* [ ]

setlocal foldmethod=indent

nnoremap <buffer> <Leader><Leader> :call ToggleCheckbox()<CR>
vnoremap <buffer> <Leader><Leader> :call ToggleCheckbox()<CR>
    
function! ToggleCheckbox()
    let l:line = getline('.')
    if l:line =~ '\s\s\*\s\[\s\]'
        let l:result = substitute(l:line, '\s\s\*\s\[\s\]', '  * [x]', ''). ' [' . strftime("%Y/%m/%d (%a) %H:%M") . ']'
        call setline('.', l:result)
    elseif l:line =~ '\s\s\*\s\[x\]'
        let l:result = substitute(substitute(l:line,'\s\s\*\s\[x\]', '  * [ ]', ''), '\s\[\d\{4}.\+]$', '','')
        call setline('.', l:result)
    else
        echo "fuu"
    end
endfunction

