" -------------------------------
" keymap
" -------------------------------
"矢印キー無効
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

nnoremap j gj
nnoremap k gk

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
"簡単な保存
nnoremap <Leader>w :w<CR>
" ヘッダーとの移動
au FileType cpp,objc,objcpp nmap <Leader>i <Plug>(altr-forward)
" コメントテンプレ展開
au FileType cpp,objc,objcpp nnoremap <Leader>d :Dox<CR>
"コメントアウト
nmap <Leader>c <Plug>(caw:I:toggle)
vmap <Leader>c <Plug>(caw:I:toggle)
" nnoremap <silent> <Leader>p :call RunIDE()<CR><CR>
" function RunIDE()
"     if (&ft=='cs')
"         :!osascript ~/.dotfiles/AppleScript/runUnity.scpt
"     else
"         :!osascript ~/.dotfiles/AppleScript/runXcode.scpt
"     endif
" endfunction

" tagbar 
nmap <Leader>t :TagbarToggle<CR>
autocmd vimrc FileType cs,cpp,mm nested :TagbarOpen
" vmodeでCtrl+cでclicpboardへコピー
vmap <C-c> :w !pbcopy<cr><cr>
" レジスタ汚染防止
nnoremap x "_x
nnoremap s "_s

" dash
nmap <silent> <Leader>d <Plug>DashSearch

nnoremap <Leader>a :Autoformat<CR>

imap <C-o> <C-x><C-o>
