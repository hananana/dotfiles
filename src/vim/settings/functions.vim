scriptencoding utf-8

augroup functions
    autocmd!
augroup END

"----------------------------------------
" reload vimrc
"----------------------------------------
command! ReloadVimrc :so ~/.vimrc

"----------------------------------------
" show path
"----------------------------------------
command! ShowPath :echo expand("%:p")

"----------------------------------------
" XBuild
"----------------------------------------
let g:xbuild_solutionPath = ''
let s:xbuild_isBuilding = 0
let s:xbuild_animation_step = 0

function! s:xBuildHandler(ch, msg)
    let l:temp_format = &errorformat
    try
        let &errorformat = '%f(%l\,%c)%m'
        caddexpr a:msg
        cwindow
    catch
        echo v:exception
        echo v:throwpoint
    finally
        let &errorformat = l:temp_format
    endtry
endfunction

function! s:animate() abort
    call timer_start(100, function('s:showFace'), { 'repeat' : -1 })
endfunction

function! s:showFace(timer) abort
    if s:xbuild_isBuilding == 0
        call timer_stop(a:timer)
        echo '(`･ω･´)DONE!!!'
        return
    endif

    let s:xbuild_animation_step = s:xbuild_animation_step + 1
    if s:xbuild_animation_step == 2
        let s:xbuild_animation_step = 0
    endif

    let l:list = ['(´･ω･`) XBuilding...', '(´-ω-`) XBuilding...']
    echo l:list[s:xbuild_animation_step]
endfunction

function! s:xBuildEndHandler(ch, msg) abort
    let s:xbuild_isBuilding = 0
endfunction

function! s:getSolutionFile() abort
    let l:fileListStr = glob(getcwd() . '/*.sln')
    let l:fileList = split(l:fileListStr, "\n")
    if len(l:fileList) != 1
        return ''
    endif
    return l:fileList[0]
endfunction

function! s:xBuild() abort
    let s:xbuild_isBuilding = 1
    call s:animate()

    let l:solutionPath = ''
    if g:xbuild_solutionPath ==# ''
        let l:solutionPath = s:getSolutionFile()
    else
        let l:solutionPath = g:xbuild_solutionPath
    endif
        
    if l:solutionPath ==# ''
        echo 'not found .sln'
        return
    endif

    cexpr []

    let l:command = ['xbuild',
                \ '/nologo',
                \ '/verbosity:quiet',
                \ '/property:AllowUnsafeBlocks=true',
                \ l:solutionPath
                \]
    let l:opt = {'callback': function('s:xBuildHandler'),
                \ 'exit_cb': function('s:xBuildEndHandler')}
    let l:job = job_start(l:command, l:opt)
endfunction

function! s:setSolutionPath(path) abort
    let g:xbuild_solutionPath = getcwd() . '/' . a:path
    echo g:xbuild_solutionPath
endfunction

command! XBuild call s:xBuild()
command! -nargs=1 -complete=file SetSolutionPath call s:setSolutionPath(<f-args>)
autocmd functions BufWritePost *.cs call s:xBuild()

"----------------------------------------
" uncrustify
"----------------------------------------
" see http://stackoverflow.com/questions/12374200/using-uncrustify-with-vim/15513829#15513829

autocmd functions FileType cs nnoremap <Leader>f :call UncrustifyAuto()<CR>

" 例: 保存時に自動フォーマット
" autocmd functions BufWritePre <buffer> :call UncrustifyAuto()

" uncrustifyの設定ファイル
let g:uncrustify_cfg_file_path = '~/.dotfiles/src/uncrustifyconfig'

" uncrustifyでフォーマットする言語
let g:uncrustify_lang = ''
" autocmd FileType c let g:uncrustify_lang = 'c'
" autocmd FileType cpp let g:uncrustify_lang = 'cpp'
" autocmd FileType java let g:uncrustify_lang = 'java'
" autocmd FileType objc let g:uncrustify_lang = 'oc'
autocmd functions FileType cs let g:uncrustify_lang = 'cs'

" Restore cursor position, window position, and last search after running a
" command.
function! Preserve(command)
    " Save the last search.
    let l:search = @/
    " Save the current cursor position.
    let l:cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let l:window_position = getpos('.')
    call setpos('.', l:cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = l:search
    " Restore the previous window position.
    call setpos('.', l:window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', l:cursor_position)
endfunction

" Don't forget to add Uncrustify executable to $PATH (on Unix) or
" %PATH% (on Windows) for this command to work.
function! Uncrustify(language)
    call Preserve(':silent %!uncrustify'.' -q '.' -l '.a:language.' -c '.
                \shellescape(fnamemodify(g:uncrustify_cfg_file_path, ':p')))
endfunction

function! UncrustifyAuto()
    if g:uncrustify_lang !=# ''
        call Uncrustify(g:uncrustify_lang)
    endif
endfunction

" --------------------------------
" Anemone
" --------------------------------
" function! AnemoneFormat() abort
"     let l = line(".")
"     let c = col(".")
"     let tempFilePath = "$HOME/AnemoneTemp.cs"
"     execute ":write! " . tempFilePath
"     0,$delete
"     execute('r! mono ~/Works/Projects/AnemoneFormat/AnemoneFormat/bin/Debug/AnemoneFormat.exe -o ' . tempFilePath)
"     0delete
"     $delete
"     call cursor(l, c)
"     call delete(tempFilePath)
" endfunction

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
