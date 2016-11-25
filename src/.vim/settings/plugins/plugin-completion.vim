augroup completion
    autocmd!
augroup END
" --------------------------------
" neocomplete
" --------------------------------
" <TAB>: completion. 
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" enter is confirm completion
inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "<CR>"

" snippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

autocmd completion FileType cs setlocal omnifunc=OmniSharp#Complete

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'
let g:neocomplete#sources#omni#input_patterns.java = '\h\w*\.\w*'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#sources#omni#input_patterns.objc = '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.objcpp = '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.go = '\h\w=.\w*'

" --------------------------------
" snippet
" --------------------------------
let g:neosnippet#snippets_directory="~/.vim/settings/snippets"

" --------------------------------
" clang_complete
" --------------------------------
let g:clang_library_path='/usr/local/opt/llvm/lib/libclang.dylib'
let g:clang_make_default_keymappings = 0
let g:clangcomplete_auto = 0
let g:clang_auto_select = 0

" --------------------------------
" javacomplete2
" --------------------------------
autocmd completion FileType java setlocal omnifunc=javacomplete#Complete

" --------------------------------
" vim-monster
" --------------------------------
let g:monster#completion#rcodetools#backend = "async_rct_complete"

" --------------------------------
" omnisharp
" --------------------------------
autocmd completion FileType cs nnoremap <Leader>ol :OmniSharpTypeLookup<CR>
autocmd completion FileType cs nnoremap <Leader>a :OmniSharpCodeFormat<CR>
autocmd completion FileType cs nnoremap <Leader>or :OmniSharpReloadSolution<CR>
autocmd completion FileType cs nnoremap <Leader>ot :OmniSharpStopServer<CR>
autocmd completion FileType cs nnoremap <Leader>os :OmniSharpStartServer<CR>

let g:OmniSharp_selector_ui = 'unite'
