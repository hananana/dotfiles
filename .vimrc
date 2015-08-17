" ファイルタイプをoff　.vimrcの基本
filetype off
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
"unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
"unite color
NeoBundle 'ujihisa/unite-colorscheme'

" nerdtree
NeoBundle 'scrooloose/nerdtree' 
let NERDTreeShowHidden = 1
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
" ファイル指定で開かれた場合はNERDTreeは表示しない
if !argc()
    autocmd vimenter * NERDTree|normal gg3j
endif

" 汎用コード補完
NeoBundle 'Shougo/neocomplete.vim'

" rubyの補完
NeoBundle 'marcus/rsense'
NeoBundle 'supermomonga/neocomplete-rsense.vim'

" csharpの補完
NeoBundle 'tpope/vim-dispatch'
NeoBundleLazy 'OmniSharp/omnisharp-vim', {
            \   'autoload': { 'filetypes': [ 'cs' ] },
            \   'build': {
            \     'windows' : 'msbuild server/OmniSharp.sln',
            \     'mac': 'xbuild server/OmniSharp.sln',
            \     'unix': 'xbuild server/OmniSharp.sln',
            \   }
            \ }

" c++の補完
NeoBundle 'git@github.com:Rip-Rip/clang_complete.git'
NeoBundle 'hanana0501/clang_complete-getopts-cocos2dx'
let g:clang_library_path="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib"
let g:clang_auto_user_options = 'path, .clang_complete, cocos2dx'

" 静的解析
" csharpで効いてないくさい
NeoBundle 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"csharpのsyntax highlight
"これも効いてないくさい
NeoBundle 'OrangeT/vim-csharp'

" snipet
NeoBundle 'Shougo/neosnippet'
NeoBundle 'hanana0501/neosnippet-snippets'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

" rubyドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'

" rubyメソッド定義元へのジャンプ
NeoBundle 'szw/vim-tags'

" 自動で閉じる
NeoBundle 'tpope/vim-endwise'

" color
NeoBundle 'altercation/vim-colors-solarized'

" いろんな非同期処理
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }

" json
NeoBundle 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0

" markdown
NeoBundle 'kannokanno/previm'
let g:previm_open_cmd = 'open -a Safari'
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

call neobundle#end()

NeoBundleCheck

" -------------------------------
" Rsense
" -------------------------------
let g:rsenseUseOmniFunc = 1
let g:rsenseHome = '/usr/local/lib/rsense-0.3'

" -------------------------------
" solarized
" -------------------------------

syntax enable
set background=dark
colorscheme solarized

" -----------------------------------------------------------------------------
" unite.vim
" -----------------------------------------------------------------------------
"insert modeで開始
let g:unite_enable_start_insert = 1

"大文字小文字を区別しない
call unite#custom#profile('default', 'context',{
        \ 'ignorecase' : 1,
        \ 'smartcase' : 1,
        \})

noremap <C-U><C-B> :Unite buffer<CR>
" ファイル一覧を一個ずつ検索
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" 最近使ったファイルの一覧
noremap <C-U><C-R> :Unite file_mru<CR>
" レジスタ一覧
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
" grep検索
noremap <C-U><C-G> :Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif

" Cキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

let g:unite_source_rec_async_command="find . -iname '*.meta' -prune -o -type f -print"

" --------------------------------
" neocomplete.vim
" --------------------------------
" Disable AutoComplPop.
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
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.cs = '[^.]\.\%(\u\{2,}\)\?'

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

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
        "let g:clang_use_library = 1

" --------------------------------
" rubocop
" --------------------------------
" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

" --------------------------------
" 基本設定
" --------------------------------
" vim内部で使われる文字エンコーディングをutf-8に設定する
set encoding=utf-8

" 想定される改行コードの指定する
set fileformats=unix,dos,mac

" インデントまわり
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set noautoindent

"新しい行を作った時に高度な自動インデントを行う
set smarttab

" ハイライトを有効化する
syntax enable
 
"バックアップファイルをとらない
set nobackup
" チルダファイル作成を完全無効化
set noundofile

" コマンドライン補完をshellと同一にする
set wildmode=list:longest
 
"クリップボードをWindowsと連携する
set clipboard=unnamed

"vi互換をオフする
set nocompatible
 
"スワップファイル用のディレクトリを指定する
set noswapfile
 
"変更中のファイルでも、保存しないで他のファイルを表示する
set hidden
 
"インクリメンタルサーチを行う
set incsearch

" 大文字小文字を区別しないで検索する
set ignorecase

"行番号を表示する
set number

" バックスペースでインデント削除
set backspace=indent,eol,start
 
"閉括弧が入力された時、対応する括弧を強調する
set showmatch
 
" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
 
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

" .vimrcの最後の基本
filetype plugin indent on
