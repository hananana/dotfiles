
" " TODO: make fuction
nnoremap <Leader>g :Ag

nnoremap <Leader>t :CtrlPTag<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>q :CtrlPQuickfix<CR>
nnoremap <Leader>o :CtrlPLine<CR>
nnoremap <Leader>y :CtrlPYankRound<CR>
nnoremap <Leader>a :CtrlpLastMode<CR>

let g:ctrlp_map = '<Leader><Leader>'
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = 'ag %s --nocolor --hidden -g ""'
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
            \ 'ToggleByFname()':      ['<nop>'],
            \ 'ToggleType(1)':        ['<nop>'],
            \ 'ToggleType(-1)':       ['<nop>'],
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
