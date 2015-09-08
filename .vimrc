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

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'https://github.com/mhinz/vim-startify'
NeoBundle 'https://github.com/easymotion/vim-easymotion'
NeoBundle 'vim-scripts/molokai'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neocomplete.vim'
"NeoBundle 'marcus/rsense'
NeoBundle 'supermomonga/neocomplete-rsense.vim'

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
"これも効いてないくさい
NeoBundleLazy 'OrangeT/vim-csharp', { 'autoload': { 'filetypes': [ 'cs', 'csi', 'csx' ] } }

" cocos2dx
NeoBundleLazy 'git@github.com:Rip-Rip/clang_complete.git', { 'autoload' : { 'filetypes' : ['cpp', 'objcpp', 'objc'] } }
NeoBundleLazy 'hanana0501/clang_complete-getopts-cocos2dx', { 'autoload' : { 'filetypes' : ['cpp', 'objcpp', 'objc'] } }
NeoBundleLazy 'vim-scripts/DoxygenToolkit.vim', { 'autoload' : { 'filetypes' : ['cpp', 'objcpp', 'objc'] } }
NeoBundleLazy 'kana/vim-altr', {'autoload' : { 'filetypes' : ['cpp', 'objcpp', 'objc']}}

" csharpで効いてないくさい
NeoBundle 'scrooloose/syntastic'

NeoBundle 'Shougo/neosnippet'
NeoBundle 'hanana0501/neosnippet-snippets'
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'
NeoBundle 'szw/vim-tags'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }
NeoBundle 'elzr/vim-json'
NeoBundleLazy 'kannokanno/previm', { 'autoload' : { 'filetypes' : ['markdown'] } }

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

" vim内部で使われる文字エンコーディングをutf-8に設定する
set encoding=utf-8

" ヘルプの検索順
set helplang=ja,en

" airlineを常時表示するよ
set laststatus=2

"キーの李マップ
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

"新しい行を作った時に高度な自動インデントを行う
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
 
"クリップボードをWindowsと連携する
set clipboard=unnamed

"vi互換をオフする
set nocompatible
 
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

" 括弧を補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>

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
" startify
" -------------------------------
let g:startify_custom_header = 
    \ map(split(system('date'), '\n'), '"  ".v:val')+['','']
let g:startify_custom_indices = ['f', 'g', 'h', 'r', 'i', 'o', 'b']
let g:startify_bookmarks = [
  \ '~/.vimrc',
  \ '~/.zshrc'
  \]
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

"ファイル検索
nnoremap <C-U><C-F> :Unite file_rec/async<CR>
" バッファ一覧表示
noremap <C-U><C-B> :Unite buffer<CR>
" レジスタ一覧
noremap <C-U><C-R> :Unite -buffer-name=register register<CR>
" grep検索
noremap <C-U><C-G> :Unite grep:. -buffer-name=search-buffer<CR>
" grep検索結果の再呼出
nnoremap <C-U><C-A> :UniteResume search-buffer<CR>
" outline表示
nnoremap <C-U><C-O> :Unite outline<CR>

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
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" 大文字小文字無視
let g:neocomplete#enable_ignore_case = 1
" Use Underbar Completion
let g:neocomplete#enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Use Vimproc
let g:neocomplete#use_vimproc = 1
" Lock Buffer Name Pattern
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Enable Prefetch
let g:neocomplete#enable_prefetch = 1

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ?  neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()
" ctrl+spaceで手動補完
inoremap <expr><nul> pumvisible() ? "\<down>" : neocomplete#start_manual_complete()

" Enable omni completion.
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" --------------------------------
" OmniSharp
" --------------------------------

autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.cs = '[^.]\.\%(\u\{2,}\)\?'

noremap <C-O><C-G> :OmniSharpGotoDefinition<CR>
noremap <C-O><C-T> :OmniSharpTypeLookup<CR>
noremap <C-O><C-R> :OmniSharpRunTests<CR>

" --------------------------------
" clang_complete
" --------------------------------
let g:clang_library_path="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib"
let g:clang_auto_user_options = 'path, .clang_complete, cocos2dx'

" neocompleteとclang_completeの共存設定
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
        endif
        let g:neocomplete#force_omni_input_patterns.c =
                    \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
        let g:neocomplete#force_omni_input_patterns.cpp =
                    \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
        let g:neocomplete#force_omni_input_patterns.objc =
                    \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
        let g:neocomplete#force_omni_input_patterns.objcpp =
                    \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'
        let g:clang_complete_auto = 0
        let g:clang_auto_select = 0
        let g:clang_default_keymappings = 0

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

