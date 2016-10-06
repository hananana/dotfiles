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
" omni補完
imap <C-o> <C-x><C-o>
" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>
"検索結果を画面中央にもってくる
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
" escをctrl+jで代替する
noremap <C-j> <esc>
noremap! <C-j> <esc>
" こっから<Leader>関連いくぜ！
" タブとウィンドウ分割"
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader>h <C-w>h
nnoremap <Leader>s :<C-u>sp<CR>
nnoremap <Leader>v :<C-u>vs<CR>
" ウィンドウ移動
" width増やす
nnoremap <Leader>L <C-w>>
" width減らす
nnoremap <Leader>H <C-w><
" height増やす
nnoremap <Leader>K <C-w>+
" height減らす
nnoremap <Leader>J <C-w>-
"簡単な保存
nnoremap <Leader>w :w<CR>
" ヘッダーとの移動
au keymap FileType cpp,objc,objcpp nmap <Leader>i <Plug>(altr-forward)
" コメントテンプレ展開
au keymap FileType cpp,objc,objcpp nnoremap <Leader>d :Dox<CR>
au keymap FileType cs nnoremap <Leader>d :LilyComment<CR>
"コメントアウト
nmap <Leader>/ <Plug>(caw:I:toggle)
vmap <Leader>/ <Plug>(caw:I:toggle)
" tagbar 
nmap <Leader>t :TagbarToggle<CR>
autocmd keymap FileType cs,cpp,mm nested :TagbarOpen
" vmodeでCtrl+cでclicpboardへコピー
vmap <C-c> :w !pbcopy<cr><cr>
" レジスタ汚染防止
nnoremap x "_x
nnoremap s "_s
" dash
nmap <silent> <Leader>d <Plug>DashSearch
" formap 
nnoremap <Leader>a :Autoformat<CR>

" nnoremap <silent> <Leader>p :call RunIDE()<CR><CR>
" function RunIDE()
"     if (&ft=='cs')
"         :!osascript ~/.dotfiles/AppleScript/runUnity.scpt
"     else
"         :!osascript ~/.dotfiles/AppleScript/runXcode.scpt
"     endif
" endfunction
