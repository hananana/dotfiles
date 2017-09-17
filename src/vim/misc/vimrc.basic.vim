set encoding=utf-8
scriptencoding utf-8
" --------------------------------
" 基本設定
" --------------------------------
augroup basic
    autocmd!
augroup END

" leaderをspaceにする
let g:mapleader = "\<Space>"
" tmuxで色を有効にする
set t_Co=256
" airlineを常時表示するよ
set laststatus=2
"キーのリマップ
nnoremap [ %
" 想定される改行コードの指定する
set fileformats=unix,dos,mac
" インデントまわり
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set cindent
" /検索でbottomからtopに戻らない
set nowrapscan
" ビープ音いらん
set visualbell t_vb=
"コマンド表示
set showcmd
"バックアップファイルをとらない
set nobackup
" チルダファイル作成を完全無効化
set noundofile
"スワップファイル用のディレクトリを指定する
set noswapfile
" コマンドライン補完をshellと同一にする
set wildmode=list:longest
"クリップボードを連携する
set clipboard=unnamed
"変更中のファイルでも、保存しないで他のファイルを表示する
set hidden
"インクリメンタルサーチを行う
set incsearch
"検索したらハイライト
set hlsearch
" 大文字小文字を区別しないで検索する
set ignorecase
set smartcase
" escした時日本語入力をやめる
inoremap <ESC> <ESC>:set iminsert=0<CR>
"行番号を表示する
set number
" バックスペースでインデント削除
set backspace=indent,eol,start
"閉括弧が入力された時、対応する括弧を強調する
set showmatch
" マクロ実行中は再描画しない
set lazyredraw
" くそ長い行を値までで略しちゃう
set synmaxcol=300
" 他のエディタなどで変更があった場合チェックする
set autoread
" 他のエディタなどで変更があった場合チェックする
set autowrite
" ウィンドウの自動調整停止
set noequalalways
" focusした時に外部から更新があったかチェック
autocmd basic WinEnter * checktime
" vimdiffを縦で割る
set diffopt=vertical
" カーソル行をハイライト
set cursorline
" previewを表示しない
set completeopt=menuone
" truecolor
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" 折りたたみ無効
set nofoldenable
" 補完ウィンドウは10項目まで
set pumheight=10 
" neovimの文字化け対策
set ttimeout
set ttimeoutlen=50

" --------------------------------
" Color
" --------------------------------

autocmd basic ColorScheme * highlight LineNr guibg=#333333
