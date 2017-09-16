scriptencoding utf-8

augroup completion
    autocmd!
augroup END

if has('nvim')

    " --------------------------------
    " deoplete.nvim
    " --------------------------------
    let g:deoplete#enable_at_startup = 1 
    let g:deoplete#auto_complete_delay = 0
    let g:deoplete#enable_refresh_always = 1
    let g:deoplete#enable_smart_case = 1

    inoremap <silent><expr> <Tab>
        \ pumvisible() ?  "\<C-n>" :
        \ deoplete#mappings#manual_complete()

    inoremap <silent> <CR> <C-r>=<SID>cr_func()<CR>
    function! s:cr_func() abort
     return pumvisible() ? deoplete#close_popup() : "\<CR>"
    endfunction


else
    " --------------------------------
    " neocomplete.vim
    " --------------------------------
    let g:neocomplete#enable_at_startup = 1

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

    function! s:my_cr_function()
    "     return neocomplete#close_popup() . "\<CR>"
        " For no inserting <CR> key.
          return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction

    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() :
    ""\<Space>"

    autocmd completion FileType cs setlocal omnifunc=OmniSharp#Complete

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
          let g:neocomplete#sources#omni#input_patterns = {}
      endif

    "let g:neocomplete#sources#omni#input_patterns.php = '[^.
    "\t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:]
    "*\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:]
    "*\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    " let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'
endif


" --------------------------------
" YouCompleteMe
" --------------------------------
" let g:UltiSnipsExpandTrigger='<c-k>'
" let g:UltiSnipsJumpForwardTrigger='<c-k>'
" let g:UltiSnipsJumpBackwardTrigger='<c-z>'
" let g:UltiSnipsEditSplit='vertical'
" let g:ycm_use_ultisnips_completer = 1
" let g:ycm_show_diagnostics_ui = 0
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_key_detailed_diagnostics = ''
" let g:ycm_global_ycm_extra_conf = '~/.dotfiles/src/global_ycm_extra_conf.py'
" let g:ycm_extra_conf_vim_data = ['&filetype', 'expand(expand("<sfile>:p:h"))']
" let g:ycm_semantic_triggers = {
"             \ 'objc' : ['re!\@"\.*"\s',
"             \ 're!\@\w+\.*\w*\s',
"             \ 're!\@\(\w+\.*\w*\)\s',
"             \ 're!\@\(\s*',
"             \ 're!\@\[.*\]\s',
"             \ 're!\@\[\s*',
"             \ 're!\@\{.*\}\s',
"             \ 're!\@\{\s*',
"             \ 're!\@\’.*\’\s',
"             \ '#ifdef ',
"             \ 're!:\s*',
"             \ 're!=\s*',
"             \ 're!,\s*', ],
"             \ 'cpp,objcpp' : [
"             \ '->','::',
"             \ 're!\@"\.*"\s',
"             \ 're!\@\w+\.*\w*\s',
"             \ 're!\@\(\w+\.*\w*\)\s',
"             \ 're!\@\(\s*',
"             \ 're!\@\[.*\]\s',
"             \ 're!\@\[\s*',
"             \ 're!\@\{.*\}\s',
"             \ 're!\@\{\s*',
"             \ 're!\@\’.*\’\s',
"             \ '#ifdef ',
"             \ 're!:\s*',
"             \ 're!=\s*',
"             \ 're!,\s*', ],
"             \ }

" --------------------------------
" vim-monster
" --------------------------------
let g:monster#completion#rcodetools#backend = 'async_rct_complete'

" --------------------------------
" javacomplete
" --------------------------------
autocmd completion FileType java setlocal omnifunc=javacomplete#Complete
