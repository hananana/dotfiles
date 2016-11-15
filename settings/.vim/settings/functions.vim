augroup functions
    autocmd!
augroup END

command! ReloadVimrc :so ~/.vimrc

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

" nnoremap <silent> <Leader>p :call RunIDE()<CR><CR>
" function RunIDE()
"     if (&ft=='cs')
"         :!osascript ~/.dotfiles/AppleScript/runUnity.scpt
"     else
"         :!osascript ~/.dotfiles/AppleScript/runXcode.scpt
"     endif
" endfunction
