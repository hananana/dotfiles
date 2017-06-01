scriptencoding utf-8

" --------------------------------
" lightline
" --------------------------------

let g:lightline = {
            \ 'colorscheme' : 'jellybeans',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'fugitive', 'filename', 'anzu' ] ]
            \ },
            \ 'component' : {
            \   'anzu' : '%{anzu#search_status()}',
            \ },
            \ 'component_function': {
            \   'readonly': 'MyReadOnly',
            \   'modified': 'MyModified',
            \   'filename' : 'MyFilename',
            \   'fugitive': 'MyFugitive',
            \ },
            \ 'component_visible_condition': {
            \   'readonly': '(&filetype!="help"&& &readonly)',
            \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }

function! MyModified()
  return &filetype =~# 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &filetype !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' !=# MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \  &filetype ==# 'unite' ? unite#get_status_string() :
        \  &filetype ==# 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' !=# expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' !=# MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
   try
    if &filetype !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let l:_ = fugitive#head()
      return strlen(l:_) ? '⭠ '.l:_ : ''
    endif
  catch
  endtry
  return ''
endfunction
