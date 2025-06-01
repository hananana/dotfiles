scriptencoding utf-8

augroup youcompleteme
    autocmd!
augroup END

let g:UltiSnipsExpandTrigger='<c-k>'
let g:UltiSnipsJumpForwardTrigger='<c-k>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
let g:UltiSnipsEditSplit='vertical'
let g:ycm_min_num_of_chars_for_completion = 99
let g:ycm_use_ultisnips_completer = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_detailed_diagnostics = ''
let g:ycm_global_ycm_extra_conf = '~/.dotfiles/src/global_ycm_extra_conf.py'
let g:ycm_extra_conf_vim_data = ['&filetype', 'expand(expand("<sfile>:p:h"))']
let g:ycm_semantic_triggers = {
            \ 'objc' : ['re!\@"\.*"\s',
            \ 're!\@\w+\.*\w*\s',
            \ 're!\@\(\w+\.*\w*\)\s',
            \ 're!\@\(\s*',
            \ 're!\@\[.*\]\s',
            \ 're!\@\[\s*',
            \ 're!\@\{.*\}\s',
            \ 're!\@\{\s*',
            \ 're!\@\’.*\’\s',
            \ '#ifdef ',
            \ 're!:\s*',
            \ 're!=\s*',
            \ 're!,\s*', ],
            \ 'cpp,objcpp' : [
            \ '->','::',
            \ 're!\@"\.*"\s',
            \ 're!\@\w+\.*\w*\s',
            \ 're!\@\(\w+\.*\w*\)\s',
            \ 're!\@\(\s*',
            \ 're!\@\[.*\]\s',
            \ 're!\@\[\s*',
            \ 're!\@\{.*\}\s',
            \ 're!\@\{\s*',
            \ 're!\@\’.*\’\s',
            \ '#ifdef ',
            \ 're!:\s*',
            \ 're!=\s*',
            \ 're!,\s*', ],
            \ }
