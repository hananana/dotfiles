augroup keymap
    autocmd!
augroup END
" -------------------------------
" keymap
" -------------------------------
"矢印キー無効
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" 移動を常にgjに
nnoremap j gj
nnoremap k gk
" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>
"検索結果を画面中央にもってくる
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
" こっから<Leader>関連いくぜ！
" タブとウィンドウ分割"
nnoremap <Leader>s :<C-u>sp<CR>
nnoremap <Leader>v :<C-u>vs<CR>
" ウィンドウ移動
" width増やす
nnoremap <Leader>> <C-w>>
" width減らす
nnoremap <Leader>< <C-w><
" height増やす
nnoremap <Leader>+ <C-w>+
" height減らす
nnoremap <Leader>- <C-w>-
" ヘッダーとの移動
au keymap FileType cpp,objc,objcpp nmap <Leader>i <Plug>(altr-forward)
" ドキュメント検索
au keymap FileType cs,cpp,objc,objcpp,vim nmap <silent> <Leader>d <Plug>DashSearch
" コメントテンプレ展開
au keymap FileType cs nnoremap <Leader>/ :LilyComment<CR>
au keymap FileType cpp,objc,objcpp nnoremap <Leader>/ :Dox<CR>
"コメントアウト
nmap <Leader>c <Plug>(caw:zeropos:toggle)
vmap <Leader>c <Plug>(caw:zeropos:toggle)
" vmodeでCtrl+cでclicpboardへコピー
vmap <C-c> :w !pbcopy<cr><cr>
" レジスタ汚染防止
nnoremap x "_x
nnoremap s "_s
" easy save
nnoremap <Leader>w :w<CR>
" help
nnoremap <Leader>h :<C-u>vertical belowright help<Space>
" tag
nnoremap <C-]> g<C-]>
