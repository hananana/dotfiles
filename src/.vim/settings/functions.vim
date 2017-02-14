augroup functions
    autocmd!
augroup END

command! ReloadVimrc :so ~/.vimrc

"----------------------------------------
" uncrustify
"----------------------------------------
" see http://stackoverflow.com/questions/12374200/using-uncrustify-with-vim/15513829#15513829

autocmd functions FileType cs nnoremap <Leader>f :call UncrustifyAuto()<CR>

" 例: 保存時に自動フォーマット
" autocmd functions BufWritePre <buffer> :call UncrustifyAuto()

" uncrustifyの設定ファイル
let g:uncrustify_cfg_file_path = '~/.dotfiles/src/.uncrustifyconfig'

" uncrustifyでフォーマットする言語
let g:uncrustify_lang = ""
" autocmd FileType c let g:uncrustify_lang = "c"
" autocmd FileType cpp let g:uncrustify_lang = "cpp"
" autocmd FileType java let g:uncrustify_lang = "java"
" autocmd FileType objc let g:uncrustify_lang = "oc"
autocmd functions FileType cs let g:uncrustify_lang = "cs"

" Restore cursor position, window position, and last search after running a
" command.
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

" Don't forget to add Uncrustify executable to $PATH (on Unix) or
" %PATH% (on Windows) for this command to work.
function! Uncrustify(language)
    call Preserve(':silent %!uncrustify'.' -q '.' -l '.a:language.' -c '.
                \shellescape(fnamemodify(g:uncrustify_cfg_file_path, ':p')))
endfunction

function! UncrustifyAuto()
    if g:uncrustify_lang != ""
        call Uncrustify(g:uncrustify_lang)
    endif
endfunction


" --------------------------------
" Anemone
" --------------------------------
function! AnemoneFormat() abort
    let l = line(".")
    let c = col(".")
    let tempFilePath = "$HOME/AnemoneTemp.cs"
    execute ":write! " . tempFilePath
    0,$delete
    execute('r! mono ~/Works/Projects/AnemoneFormat/AnemoneFormat/bin/Debug/AnemoneFormat.exe -o ' . tempFilePath)
    0delete
    $delete
    call cursor(l, c)
    call delete(tempFilePath)
endfunction

" autocmd vimrc FileType cs nnoremap <C-s> :call AnemoneFormat()<CR>

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
