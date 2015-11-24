filetype plugin indent off

" -------------------------------
" NeoBundle
" -------------------------------
"YCMがinstallに時間がかかるので対策
let g:neobundle#install_process_timeout = 1500

if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

"必須系
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'mopp/mopkai.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neocomplete.vim' 
NeoBundle 'tyru/caw.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }
NeoBundle 'Shougo/unite-help'

"C系補完の神
NeoBundle 'Valloric/YouCompleteMe', {
            \ 'build'      : {
            \ 'mac'     : './install.py --clang-completer --omnisharp-completer --gocode-completer',
            \ 'unix'    : './install.py --clang-completer --omnisharp-completer',
            \ 'windows' : './install.py --clang-completer --omnisharp-completer',
            \ 'cygwin'  : './install.py --clang-completer --omnisharp-completer'
            \ }
            \ }

NeoBundleLazy 'OrangeT/vim-csharp', { 'autoload': { 'filetypes': [ 'cs', 'csi', 'csx' ] } }
NeoBundleLazy 'vim-scripts/DoxygenToolkit.vim', { 'autoload' : { 'filetypes' : ['cpp', 'objcpp', 'objc'] } }
NeoBundleLazy 'kana/vim-altr', {'autoload' : { 'filetypes' : ['cpp', 'objcpp', 'objc']}}
NeoBundle 'octol/vim-cpp-enhanced-highlight'
NeoBundle 'b4winckler/vim-objc'

" swift
NeoBundle 'keith/swift.vim'
NeoBundle 'tokorom/neocomplete-swift-dictionary'

" ruby
NeoBundle 'NigoroJr/rsense'
NeoBundle 'supermomonga/neocomplete-rsense.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'
NeoBundle 'szw/vim-tags'
NeoBundle 'tpope/vim-endwise'

" snippets 
NeoBundle 'https://github.com/SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'

" json
NeoBundle 'elzr/vim-json'

" markdown
NeoBundleLazy 'kannokanno/previm', { 'autoload' : { 'filetypes' : ['markdown'] } }
NeoBundle 'mattn/qiita-vim'

" yaml
NeoBundleLazy 'stephpy/vim-yaml', { 'autoload' : { 'filetypes' : ['yaml'] } }

" zatsu
NeoBundleLazy 'git@github.com:hananana/rockradio.vim.git', { 'depends' : [ 'Shougo/unite.vim' ] }
if neobundle#tap('rockradio.vim')
    call neobundle#config({
                \ 'autoload' : {
                \   'unite_sources' : [ 'jazzradio' ], 
                \   'commands' : [ 
                \       'JazzradioUpdateChannels', 
                \       'JazzradioStop', 
                \       { 
                \           'name' : 'JazzradioPlay', 
                \           'complete' : 'customlist,jazzradio#channel_id_complete' 
                \       } 
                \   ], 
                \   'function_prefix' : 'jazzradio' 
                \  } 
                \ }) 
endif

call neobundle#end()

NeoBundleCheck

" --------------------------------
" plugin on!!!!!!!!!!!!!!!
" --------------------------------
filetype plugin indent on
" --------------------------------
" 基本設定
" --------------------------------
" leaderをspaceにする
let mapleader = "\<Space>"
" コメント付きコピペを正常に行う＆コメントの改行時に自動挿入をやめる
" ただし、csでは効いてない。。。なぜだC-Uでとりあえず対処すべし
augroup ForMatOptionsGroup
autocmd!
au FileType * setlocal formatoptions=cq
augroup END
" vim内部で使われる文字エンコーディングをutf-8に設定する
set encoding=utf-8
" tmuxで色を有効にする
set t_Co=256
" ヘルプの検索順
set helplang=ja,en
" airlineを常時表示するよ
set laststatus=2
"キーのリマップ
nnoremap [ %
" 日本語のずれをなくす
set ambiwidth=double
" 想定される改行コードの指定する
set fileformats=unix,dos,mac
" インデントまわり
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=0
set autoindent
set cindent
set smarttab
" ビープ音いらん
set vb t_vb=
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
set clipboard+=unnamed,autoselect
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
"tagファイルの場所
set tags=./tags
" マクロ実行中は再描画しない
set lazyredraw
" くそ長い行を値までで略しちゃう
set synmaxcol=300
" よくわからんけど早い設定
set ttyfast
" 他のエディタなどで変更があった場合チェックする
set autoread
augroup vimrc-checktime
    autocmd!
    autocmd WinEnter * checktime
augroup END
"プレビューウィンドウ固定
set previewheight=125

augroup PreviewGroup
    autocmd!
    au BufEnter ?* call PreviewHeightWorkAround()
augroup END

func PreviewHeightWorkAround()
    if &previewwindow
        exec 'setlocal winheight='.&previewheight
    endif
endfunc

" -------------------------------
" keymap
" -------------------------------
"矢印キー無効
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

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
" タブとウィンドウ分割"
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sn gt
nnoremap sp gT
nnoremap st :<C-u>tabnew<CR>
nnoremap sc :<C-u>tabclose<CR>
"簡単な保存
nnoremap <Leader>w :w<CR>

" unite呼び出し
nnoremap <Leader>uu :Unite<CR>
"ファイル検索
nnoremap <Leader><Leader> :Unite file_rec/async<CR>
" タブ一覧
nnoremap <Leader>ut :Unite tab<CR>
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
" Cキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
au FileType unite nnoremap <silent> <buffer> <C-J><C-J> :q<CR>
au FileType unite inoremap <silent> <buffer> <C-J><C-J> <ESC>:q<CR>
" uniteでhelp
nnoremap <Leader>uh :Unite help<CR>
" uniteでインクリメンタル検索
nnoremap <Leader>uf :Unite line<CR>
"ファイルツリー表示
nnoremap <silent> <C-e>      :NERDTreeToggle<CR>
vnoremap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
onoremap <silent> <C-e>      :NERDTreeToggle<CR>
inoremap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cnoremap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
" ヘッダーとの移動
au FileType cpp,objc,objcpp,cs nmap <Leader>h <Plug>(altr-forward)
" コメントテンプレ展開
au FileType cpp,objc,objcpp nnoremap <Leader>d :Dox<CR>
"コメントアウト
nmap <Leader>c <Plug>(caw:I:toggle)
vmap <Leader>c <Plug>(caw:I:toggle)
"uniteによるタグジャンプと戻る
augroup TagJump
    autocmd!
    autocmd BufEnter *
                \   if empty(&buftype)
                \|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
                \|  endif
    autocmd BufEnter *
                \   if empty(&buftype)
                \|      nnoremap <buffer> <C-t> :<C-u>Unite jump<CR>
                \|  endif
augroup END
" fugitive
nnoremap <Leader>gt :Git<space>
nnoremap <Leader>gs :Gstatus<CR>
" neocompleteのonoff
nnoremap <Leader>n :NeoCompleteToggle<CR>

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

let g:unite_source_rec_async_command =
            \ ['ag', '--follow', '--nocolor', '--nogroup',
            \  '--hidden', '-g', '']
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
            \ '-i --vimgrep --hidden --ignore ' .
            \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''

" --------------------------------
" nerdtree
" --------------------------------
"デフォで隠しファイルを表示する
let NERDTreeShowHidden = 1

" --------------------------------
" lightline
" --------------------------------
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ }
      \ }

" -------------------------------
" syntax
" -------------------------------
syntax on
let g:moleokai_original=1
colorscheme mopkai

" -------------------------------
" vim-airline
" -------------------------------
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'molokai'
let g:airline#extension#tabline#enabled = 1

" --------------------------------
" neocomplete.vim
" --------------------------------
" neocompleteは自動では始めない
let g:neocomplete#enable_at_startup = 0
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" 大文字小文字無視
let g:neocomplete#enable_ignore_case = 1
" Use Underbar Completion
let g:neocomplete#enable_underbar_completion = 1
" 2文字目から全力で補完します
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#sources#syntax#min_keyword_length = 2
" Use Vimproc
let g:neocomplete#use_vimproc = 1
" Lock Buffer Name Pattern
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" よくわからんが公式推奨設定
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" --------------------------------
" YouCompleteMe
" --------------------------------
let g:ycm_filetype_whitelist = { 'cpp' : 1, 'objc' : 1, 'objcpp' : 1, 'cs' : 1 , 'go' : 1, 'python' : 1 }
let g:ycm_filetype_blacklist = { 'swift' : 1 }
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0

" --------------------------------
" ultysnips
" --------------------------------
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" -------------------------------
" Rsense
" -------------------------------
let g:rsenseUseOmniFunc = 1
let g:rsenseHome = '/usr/local/lib/rsense-0.3'

" --------------------------------
" vim-json
" --------------------------------
let g:vim_json_syntax_conceal = 0

" --------------------------------
" markdown
" --------------------------------
let g:previm_open_cmd = 'open -a Google\ Chrome'
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
