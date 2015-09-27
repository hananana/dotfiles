filetype plugin indent off

" -------------------------------
" NeoBundle
" -------------------------------
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

"必須系
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'https://github.com/easymotion/vim-easymotion'
NeoBundle 'mopp/mopkai.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neocomplete.vim' 
NeoBundle 'scrooloose/syntastic'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'tyru/caw.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }

"C系補完の神
NeoBundle 'https://github.com/Valloric/YouCompleteMe'
NeoBundleLazy 'OrangeT/vim-csharp', { 'autoload': { 'filetypes': [ 'cs', 'csi', 'csx' ] } }
NeoBundleLazy 'vim-scripts/DoxygenToolkit.vim', { 'autoload' : { 'filetypes' : ['cpp', 'objcpp', 'objc'] } }
NeoBundleLazy 'kana/vim-altr', {'autoload' : { 'filetypes' : ['cpp', 'objcpp', 'objc']}}

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

" zatsu
NeoBundleLazy 'hanana0501/rockradio.vim', { 'depends' : [ 'Shougo/unite.vim' ] }
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
au FileType * setlocal formatoptions=cq
" vim内部で使われる文字エンコーディングをutf-8に設定する
set encoding=utf-8
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
"tagファイルの場所
set tags=./.git/

" -------------------------------
" keymap
" -------------------------------
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
"easymotion
nnoremap <Leader>e <Plug>(easymotion-s2)
"ファイル検索
nnoremap <Leader>uf :Unite file_rec/async<CR>
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
"ファイルツリー表示
nnoremap <silent> <C-e>      :NERDTreeToggle<CR>
vnoremap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
onoremap <silent> <C-e>      :NERDTreeToggle<CR>
inoremap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cnoremap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
" ヘッダーとの移動
au FileType cpp,objc,objcpp,cs nmap <Leader>h <Plug>(altr-forward)
" alignそろえる 
vmap <Enter> <Plug>(EasyAlign)
" コメントテンプレ展開
au FileType cpp,objc,objcpp nnoremap <Leader>d :Dox<CR>

"コメントアウト
nmap <Leader>c <Plug>(caw:I:toggle)
vmap <Leader>c <Plug>(caw:I:toggle)
"uniteによるタグジャンプと戻る
autocmd BufEnter *
            \   if empty(&buftype)
            \|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
            \|  endif
autocmd BufEnter *
            \   if empty(&buftype)
            \|      nnoremap <buffer> <C-t> :<C-u>Unite jump<CR>
            \|  endif

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

" -------------------------------
" easymotion
" -------------------------------
let g:EasyMotion_do_mapping = 0

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
let g:ycm_filetype_whitelist = { 'cpp' : 1, 'objc' : 1, 'objcpp' : 1, 'cs' : 1 }
let g:ycm_min_num_of_chars_for_completion = 0

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

" --------------------------------
" syntastic
" --------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby', 'cpp', 'cs', 'objc', 'objcpp'] }
" 設定が不完全なのでいったんcocos系をはじく
"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby', 'cs'] }
let g:syntastic_ruby_checkers = ['rubocop']

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

" --------------------------------
" auto-ctags
" --------------------------------
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']
