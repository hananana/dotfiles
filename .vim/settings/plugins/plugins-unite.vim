" -----------------------------------------------------------------------------
" unite.vim
" <C-l>でキャッシュを更新しようぜ！
" -----------------------------------------------------------------------------
"insert modeで開始
let g:unite_enable_start_insert = 1

"大文字小文字を区別しない
call unite#custom#profile('default', 'context',{
        \ 'ignorecase' : 1,
        \ 'smartcase' : 1,
        \})
call unite#custom#source('file', 'matchers',"matcher_default")

let g:unite_source_rec_async_command =
            \ ['ag', '--follow', '--nocolor', '--nogroup',
            \  '--hidden', '-g', '']
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
            \ '-i --vimgrep --hidden --ignore ' .
            \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''

" unite呼び出し
nnoremap <Leader>uu :Unite<CR>
nnoremap <Leader>uf :Unite file<CR>
"ファイル検索
nnoremap <Leader><Leader> :Unite file_rec/async<CR>
" バッファ一覧表示
noremap <Leader>ub :Unite buffer<CR>
" レジスタ一覧
noremap <Leader>ur :Unite -buffer-name=register register<CR>
" grep検索
noremap <Leader>ug :Unite grep:. -buffer-name=search-buffer<CR>
" grep検索結果の再呼出
nnoremap <Leader>ua :UniteResume search-buffer<CR>
" outline表示
nnoremap <Leader>uo :Unite outline<CR>
" uniteでインクリメンタル検索
nnoremap <Leader>ul :Unite line<CR>
" Cキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
au FileType unite nnoremap <silent> <buffer> <C-J><C-J> :q<CR>
au FileType unite inoremap <silent> <buffer> <C-J><C-J> <ESC>:q<CR>
"uniteによるタグジャンプと戻る
autocmd vimrc BufEnter *
            \   if empty(&buftype)
            \|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
            \|  endif
autocmd vimrc BufEnter *
            \   if empty(&buftype)
            \|      nnoremap <buffer> <C-t> :<C-u>Unite jump<CR>
            \|  endif
