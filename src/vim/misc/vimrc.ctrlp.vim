nnoremap <Leader>gg :grep 
nnoremap <Leader>gc :grep <cword>

" --------------------------------
" ctrlp.vim
" --------------------------------
nnoremap <Leader>t :CtrlPTag<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>m :CtrlPMRUFiles<CR>
nnoremap <Leader>q :CtrlPQuickfix<CR>

let g:ctrlp_map = '<Leader><Leader>'
let g:ctrlp_show_hidden = 0

let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'

let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_prompt_mappings = {
            \ 'PrtBS()':              ['<bs>'],
            \ 'PrtDelete()':          ['<del>'],
            \ 'PrtDeleteWord()':      ['<nop>'],
            \ 'PrtClear()':           ['<nop>'],
            \ 'PrtSelectMove("j")':   ['<c-n>'],
            \ 'PrtSelectMove("k")':   ['<c-p>'],
            \ 'PrtSelectMove("t")':   ['<nop>'],
            \ 'PrtSelectMove("b")':   ['<nop>'],
            \ 'PrtSelectMove("u")':   ['<nop>'],
            \ 'PrtSelectMove("d")':   ['<nop>'],
            \ 'PrtHistory(-1)':       ['<nop>'],
            \ 'PrtHistory(1)':        ['<nop>'],
            \ 'AcceptSelection("e")': ['<cr>'],
            \ 'AcceptSelection("h")': ['<c-h>'],
            \ 'AcceptSelection("t")': ['<nop>'],
            \ 'AcceptSelection("v")': ['<c-v>'],
            \ 'ToggleFocus()':        ['<nop>'],
            \ 'ToggleRegex()':        ['<nop>'],
            \ 'ToggleByFname()':      ['<c-d>'],
            \ 'ToggleType(1)':        ['<c-k>'],
            \ 'ToggleType(-1)':       ['<c-j>'],
            \ 'PrtExpandDir()':       ['<nop>'],
            \ 'PrtInsert("c")':       ['<nop>'],
            \ 'PrtInsert()':          ['<nop>'],
            \ 'PrtCurStart()':        ['<nop>'],
            \ 'PrtCurEnd()':          ['<nop>'],
            \ 'PrtCurLeft()':         ['<nop>'],
            \ 'PrtCurRight()':        ['<nop>'],
            \ 'PrtClearCache()':      ['<c-l>'],
            \ 'PrtDeleteEnt()':       ['<nop>'],
            \ 'CreateNewFile()':      ['<nop>'],
            \ 'MarkToOpen()':         ['<nop>'],
            \ 'OpenMulti()':          ['<nop>'],
            \ 'PrtExit()':            ['<c-[>'],
            \ }
