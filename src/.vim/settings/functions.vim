augroup functions
    autocmd!
augroup END

command! ReloadVimrc :so ~/.vimrc

" --------------------------------
" astyle
" --------------------------------
function! AStyleFormat() abort
    let l:pos = getpos(".")
    :%!astyle --style=allman --indent-namespaces --indent-continuation=3
    :call setpos(".", pos)
endfunction

autocmd functions FileType cs nnoremap <Leader>a :call AStyleFormat()<CR>

" --------------------------------
" develop
" --------------------------------
function! AnemoneFormat() abort
    let l = line(".")
    let c = col(".")
    let tempFilePath = "$HOME/AnemoneTemp.cs"
    execute ":write! " . tempFilePath
    0,$delete
    execute('r! mono ~/Works/Projects/Anemone/AnemoneFormat/bin/Debug/AnemoneFormat.exe -o ' . tempFilePath)
    0delete
    $delete
    call cursor(l, c)
    call delete(tempFilePath)
endfunction
" autocmd vimrc FileType cs nnoremap <Leader>a :call AnemoneFormat()<CR>

" --------------------------------
" unite
" --------------------------------
function! AddUniteCustonSource() abort
    let pattern = '/\v(.git/|.vim/plugged)'
    call unite#custom#source('file_rec, file_rec/async', 'ignore_pattern', pattern)

" FIXME: gitignoreをparseできるようにしたい 
"     let ignoreList = ['.git]
"
"     if filereadable('.gitignore')
"         for file in readfile('.gitignore')
"             echo file
"             if file !~ "^#\\|^\s\*$"
"                 call add(ignoreList, file)
"             endif
"         endfor
"     endif
"     echo ignoreList


"     call unite#custom#source('file_rec, file_rec/async', 'ignore_pattern', '.vim/plugged')

"     let ignoreList = ['.git/**']
"
"     if filereadable('.gitignore')
"         for file in readfile('.gitignore')
"             if file !~ "^#\\|^\s\*$"
"                 call add(ignoreList, file)
"             endif
"         endfor
"     endif
"
"     call unite#custom#source('file_rec, file_rec/async', 'ignore_globs', ignoreList)
endfunction
call AddUniteCustonSource()

" --------------------------------
" vimからIDE RUN
" --------------------------------
" nnoremap <silent> <Leader>p :call RunIDE()<CR><CR>
" function RunIDE()
"     if (&ft=='cs')
"         :!osascript ~/.dotfiles/AppleScript/runUnity.scpt
"     else
"         :!osascript ~/.dotfiles/AppleScript/runXcode.scpt
"     endif
" endfunction
