" --------------------------------
" neocomplete
" --------------------------------
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

augroup neocomplete
    autocmd!
augroup END
autocmd neocomplete FileType cs setlocal omnifunc=OmniSharp#Complete

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'
let g:neocomplete#sources#omni#input_patterns.java = '\h\w*\.\w*'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#sources#omni#input_patterns.objc = '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.objcpp = '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'

" --------------------------------
" clang_complete
" --------------------------------
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
let g:clangcomplete_auto = 0
let g:clang_auto_select = 0
let g:clang_omnicppcomplete_compliance = 0
let g:clang_make_default_keymappings = 0

" --------------------------------
" javacomplete2
" --------------------------------
autocmd vimrc FileType java setlocal omnifunc=javacomplete#Complete
