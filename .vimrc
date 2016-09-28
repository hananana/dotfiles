filetype plugin indent off

augroup vimrc
    autocmd!
augroup END

" -------------------------------
" vim-plug
" -------------------------------
if has('vim_starting')
    set rtp+=~/.vim/plugged/vim-plug
    if !isdirectory(expand('~/.vim/plugged/vim-plug'))
        echo 'install vim-plug...'
        call system('mkdir -p ~/.vim/plugged/vim-plug')
        call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
    end
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}
Plug 'Shougo/vimproc.vim', {'dir': '~/.vim/plugged/vimproc.vim', 'do': 'make'}

" must
Plug 'itchyny/lightline.vim' | Plug 'tpope/vim-fugitive'
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'tsukkee/unite-tag'
Plug 'Shougo/neomru.vim'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/neocomplete.vim' 
Plug 'tyru/caw.vim'
Plug 'majutsushi/tagbar'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/syntastic'
Plug 'xolox/vim-session' | Plug 'xolox/vim-misc'
Plug 'rizzatti/dash.vim'
Plug 'lambdalisue/vim-gita'
Plug 'kana/vim-smartchr'
Plug 'Shougo/vimfiler.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'mopp/layoutplugin.vim'

" self
" Plug 'hananana/lilycomment.vim'

" scheme
Plug 'ujihisa/unite-colorscheme'
Plug 'flazz/vim-colorschemes'
Plug 'mopp/mopkai.vim'
Plug 'hananana/jellybeans.vim'
Plug 'vim-scripts/twilight'
Plug 'sjl/badwolf'
Plug 'w0ng/vim-hybrid'
Plug 'aereal/vim-colors-japanesque'

" complete
Plug 'Valloric/YouCompleteMe', {'dir': '~/.vim/plugged/YouCompleteMe', 'do' : './install.py --clang-completer --omnisharp-completer'}
Plug 'https://github.com/SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'artur-shaik/vim-javacomplete2', { 'for': [ 'java' ] }
Plug 'ervandew/eclim', { 'for': [ 'ruby' ] }

" syntax
Plug 'OrangeT/vim-csharp', { 'for':  [ 'cs', 'csi', 'csx' ]  }
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'b4winckler/vim-objc'
Plug 'keith/swift.vim'
Plug 'vim-scripts/ShaderHighLight'

" other
Plug 'vim-scripts/DoxygenToolkit.vim', { 'for' : ['cpp', 'objcpp', 'objc'] } 
Plug 'kana/vim-altr', {'for' : ['cpp', 'objcpp', 'objc'] }
Plug 'elzr/vim-json'
Plug 'kannokanno/previm', { 'for' : [ 'markdown' ] }
Plug 'stephpy/vim-yaml', { 'for' : [ 'yaml' ] }
Plug 'aklt/plantuml-syntax'
Plug 'soramugi/auto-ctags.vim'

" ruby
" NeoBundle 'thinca/vim-ref'
" NeoBundle 'yuku-t/vim-ref-ri'
" NeoBundle 'szw/vim-tags'
" NeoBundle 'tpope/vim-endwise'

call plug#end()
filetype plugin indent on

" --------------------------------
" 基本設定
" --------------------------------
" leaderをspaceにする
let mapleader = "\<Space>"
" コメント付きコピペを正常に行う＆コメントの改行時に自動挿入をやめる
" ただし、csでは効いてない。。。なぜだC-Uでとりあえず対処すべし
" augroup ForMatOptionsGroup
" autocmd!
" au FileType * setlocal formatoptions=cq
" augroup END

" vim内部で使われる文字エンコーディングをutf-8に設定する
set encoding=utf-8
" tmuxで色を有効にする
set t_Co=256
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
set smarttab
set cindent

" /検索でbottomからtopに戻らない
set nowrapscan
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
set clipboard=unnamed,autoselect
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
" ウィンドウの自動調整停止
set noequalalways

autocmd vimrc WinEnter * checktime

" 閉じる時ついでにnerdtreeも閉じる
autocmd vimrc bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
" easymotion
nmap <Leader>e <Plug>(easymotion-s2)
" Cキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
au FileType unite nnoremap <silent> <buffer> <C-J><C-J> :q<CR>
au FileType unite inoremap <silent> <buffer> <C-J><C-J> <ESC>:q<CR>
"ファイルツリー表示
nnoremap <silent> <C-e>      :NERDTreeToggle<CR>
vnoremap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
onoremap <silent> <C-e>      :NERDTreeToggle<CR>
inoremap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cnoremap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
" ヘッダーとの移動
au FileType cpp,objc,objcpp nmap <Leader>i <Plug>(altr-forward)
" コメントテンプレ展開
au FileType cpp,objc,objcpp nnoremap <Leader>d :Dox<CR>
"コメントアウト
nmap <Leader>c <Plug>(caw:I:toggle)
vmap <Leader>c <Plug>(caw:I:toggle)
"uniteによるタグジャンプと戻る
autocmd vimrc BufEnter *
            \   if empty(&buftype)
            \|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
            \|  endif
autocmd vimrc BufEnter *
            \   if empty(&buftype)
            \|      nnoremap <buffer> <C-t> :<C-u>Unite jump<CR>
            \|  endif

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

" csharp要のlambda代替（本当はindent/cs.vimでやりたい)
inoremap <silent> <C-l> <CR><BS><BS>{}<Left><CR><CR><Up><Tab>

" ycm
nnoremap <Leader>yg :YcmCompleter GetType<CR>
nnoremap <Leader>yd :YcmShowDetailedDiagnostic<CR>

" dash
nmap <silent> <Leader>d <Plug>DashSearch

" smartchr
inoremap <buffer> <expr> = smartchr#loop('=', ' = ', ' == ')
inoremap <buffer> <expr> + smartchr#loop('+', ' + ', '++')
inoremap <buffer> <expr> - smartchr#loop('-', ' -  ', '--')
inoremap <buffer> <expr> * smartchr#loop('*', ' * ')
inoremap <buffer> <expr> / smartchr#loop('/', ' / ')


" -------------------------------
" pluginごとの設定
" -------------------------------
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
" vimfiler
" --------------------------------

nnoremap <silent> <Leader>uv :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

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
" scheme
" -------------------------------

syntax on
colorscheme solarized
set background=dark
let g:solarized_termcolors=256

" --------------------------------
" YouCompleteMe
" --------------------------------
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:EclimCompletionMethod = 'omnifunc'

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
" let g:rsenseUseOmniFunc = 1
" let g:rsenseHome = '/usr/local/lib/rsense-0.3'

" --------------------------------
" vim-json
" --------------------------------
let g:vim_json_syntax_conceal = 0

" --------------------------------
" markdown
" --------------------------------
let g:previm_open_cmd = 'open -a Google\ Chrome'
autocmd vimrc BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

" --------------------------------
" session
" --------------------------------
" 現在のディレクトリ直下の .vimsessions/ を取得 
let s:local_session_directory = xolox#misc#path#merge(getcwd(), '.vimsessions')
" 存在すれば
if isdirectory(s:local_session_directory)
    let g:session_directory = s:local_session_directory
    let g:session_autosave = 'yes'
    let g:session_autoload = 'yes'
    let g:session_autosave_periodic = 1
else
    let g:session_autosave = 'no'
    let g:session_autoload = 'no'
    let g:session_autosave_periodic = 0
endif
unlet s:local_session_directory

" --------------------------------
" easy-motion
" --------------------------------
" disable default mappings
let g:EasyMotion_do_mapping = 0

" --------------------------------
" plantuml
" --------------------------------
let g:plantuml_excutable_script="~/.dotfiles/scripts/make_uml"

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

" --------------------------------
" javacomplete2
" --------------------------------
autocmd vimrc FileType java setlocal omnifunc=javacomplete#Complete

" --------------------------------
" vim-autoformat
" --------------------------------
let g:formatdef_my_custom_cs = '"astyle --style=allman"'
let g:formatters_cs = ['my_custom_cs']
autocmd vimrc BufWrite *.cs :Autoformat
