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
NeoBundle 'Shougo/neocomplete.vim' 
NeoBundle 'https://github.com/easymotion/vim-easymotion'
NeoBundle 'vim-scripts/molokai'
NeoBundle 'bling/vim-airline'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }

" cs
NeoBundleLazy 'tpope/vim-dispatch', { 'autoload' : { 'filetypes' : ['cs'] } }
NeoBundleLazy 'OmniSharp/omnisharp-vim', {
            \   'autoload': { 'filetypes': [ 'cs' ] },
            \   'build': {
            \     'windows' : 'msbuild server/OmniSharp.sln',
            \     'mac': 'xbuild server/OmniSharp.sln',
            \     'unix': 'xbuild server/OmniSharp.sln',
            \   }
            \ }
NeoBundleLazy 'OrangeT/vim-csharp', { 'autoload': { 'filetypes': [ 'cs', 'csi', 'csx' ] } }

" cocos2dx
NeoBundle 'https://github.com/Valloric/YouCompleteMe'
NeoBundleLazy 'vim-scripts/DoxygenToolkit.vim', { 'autoload' : { 'filetypes' : ['cpp', 'objcpp', 'objc'] } }
NeoBundleLazy 'kana/vim-altr', {'autoload' : { 'filetypes' : ['cpp', 'objcpp', 'objc']}}

" ruby
"NeoBundle 'marcus/rsense'
NeoBundle 'supermomonga/neocomplete-rsense.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'
NeoBundle 'szw/vim-tags'
NeoBundle 'tpope/vim-endwise'

" zatus
NeoBundle 'Shougo/neosnippet'
NeoBundle 'hanana0501/neosnippet-snippets'
NeoBundle 'elzr/vim-json'
NeoBundleLazy 'kannokanno/previm', { 'autoload' : { 'filetypes' : ['markdown'] } }
if neobundle#tap('jazzradio.vim')
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
set smartindent
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
" 大文字小文字を区別しないで検索する
set ignorecase
set smartcase
"行番号を表示する
set number
" バックスペースでインデント削除
set backspace=indent,eol,start
"閉括弧が入力された時、対応する括弧を強調する
set showmatch
" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>
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

" -------------------------------
" easy-motion
" -------------------------------
let g:EasyMotion_do_mapping = 0
nmap e <Plug>(easymotion-s2)

" -------------------------------
" syntax
" -------------------------------
syntax on
let g:moleokai_original=1
colorscheme molokai

" -------------------------------
" vim-airline
" -------------------------------
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'molokai'
let g:airline#extension#tabline#enabled = 1

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

" --------------------------------
" nerdtree
" --------------------------------

"デフォで隠しファイルを表示する
let NERDTreeShowHidden = 1

nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>

" --------------------------------
" neocomplete.vim
" --------------------------------
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" 大文字小文字無視
let g:neocomplete#enable_ignore_case = 1
" Use Underbar Completion
let g:neocomplete#enable_underbar_completion = 1
" 1文字目から全力で補完します
let g:neocomplete#auto_completion_start_length = 1
let g:neocomplete#sources#syntax#min_keyword_length = 1
" Use Vimproc
let g:neocomplete#use_vimproc = 1
" Lock Buffer Name Pattern
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" よくわからんが公式推奨設定
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    if neobundle#tap('neocomplete.vim')
        return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    elseif
        return "\<CR>"
    endif
endfunction

" For smart TAB completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ neocomplete#start_manual_complete()
function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" Enable omni completion.
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.objc = '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.objcpp = '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'

" --------------------------------
" OmniSharp
" --------------------------------
au FileType cs noremap <C-G> :OmniSharpGotoDefinition<CR>
au FileType cs noremap <C-T> :OmniSharpTypeLookup<CR>

" --------------------------------
" YouCompleteMe
" --------------------------------
au FileType cpp,objc,objcpp noremap <C-O><C-G> :YcmCompleter GoToDeclaration
au FileType cpp,objc,objcpp noremap <C-O><C-T> :YcmCompleter GetType
let g:ycm_filetype_whitelist = { 'cpp' : 1, 'objc' : 1, 'objcpp' : 1 }

" --------------------------------
" vim-altr
" --------------------------------
nmap <space><space> <Plug>(altr-forward)

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
"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby', 'cpp', 'cs', 'objc', 'objcpp'] }
" 設定が不完全なのでいったんcocos系をはじく
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby', 'cs'] }
let g:syntastic_ruby_checkers = ['rubocop']


" --------------------------------
" vim-easy-align
" --------------------------------
vmap <Enter> <Plug>(EasyAlign)

" --------------------------------
" neosnippet
" --------------------------------

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

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

