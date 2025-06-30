" augroup {{{
augroup vimrc
    autocmd!
augroup END
" }}}
" encoding and color {{{
if has('vim_starting')
    set encoding=utf-8
    scriptencoding utf-8

    if !has('gui_running') && exists(&termguicolors) && $COLORTERM ==# 'truecolor'
        let &t_8f = "\e[38;2;%lu;%lu;%lum"
        let &t_8b = "\e[48;2;%lu;%lu;%lum"
        set termguicolors
    endif

endif
" }}}
" utils {{{

command! ReloadVimrc :source $HOME/src/github.com/hananana/dotfiles/src/nvim/init.vim
command! ShowPath :echo expand("%:p")
command! RemoveTildeM :%s///g
command! FixResolutionFiles call FixResolutionFiles()

" is windows{{{
function! IsWindows()
    return has('win64') || has('win32') || has('win16')
endfunction
" }}}
" echomsg startup time {{{
if has('vim_starting') && has('reltime')
    let g:startuptime = reltime()
    autocmd vimrc VimEnter * let g:startuptime = reltime(g:startuptime) | redraw | echomsg 'startuptime: ' . reltimestr(g:startuptime)
endif
" }}}
" run ide {{{
nnoremap <silent> <Leader>p :call RunIDE()<CR><CR>
function! RunIDE()
    if (&ft=='cs')
        :!osascript ~/.dotfiles/AppleScript/runUnity.scpt
    else
        :!osascript ~/.dotfiles/AppleScript/runXcode.scpt
    endif
endfunction
" }}}
" preview markdown {{{
if !has('mac')
    command! MarkDownPreview call MarkDownPreview()
    function! MarkDownPreview()
        let l:path = strpart(substitute(expand('%:p'), getcwd(), '', 'g'), 1)
        execute('!/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe ' . l:path)
    endfunction
endif
" }}}
" uncrustify {{{
" see http://stackoverflow.com/questions/12374200/using-uncrustify-with-vim/15513829#15513829

autocmd vimrc FileType cs nnoremap <Leader>f :call UncrustifyAuto()<CR>

" 例: 保存時に自動フォーマット
" autocmd functions BufWritePre <buffer> :call UncrustifyAuto()

" uncrustifyの設定ファイル
let g:uncrustify_cfg_file_path = expand('$DOTDIR/src/uncrustifyconfig')

" uncrustifyでフォーマットする言語
let g:uncrustify_lang = ''
" autocmd FileType c let g:uncrustify_lang = 'c'
" autocmd FileType cpp let g:uncrustify_lang = 'cpp'
" autocmd FileType java let g:uncrustify_lang = 'java'
" autocmd FileType objc let g:uncrustify_lang = 'oc'
autocmd vimrc FileType cs let g:uncrustify_lang = 'cs'

" Restore cursor position, window position, and last search after running a
" command.
function! Preserve(command)
    " Save the last search.
    let l:search = @/
    " Save the current cursor position.
    let l:cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let l:window_position = getpos('.')
    call setpos('.', l:cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = l:search
    " Restore the previous window position.
    call setpos('.', l:window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', l:cursor_position)
endfunction

" Don't forget to add Uncrustify executable to $PATH (on Unix) or
" %PATH% (on Windows) for this command to work.
function! Uncrustify(language)
    call Preserve(':silent %!uncrustify'.' -q '.' -l '.a:language.' -c '.
                \shellescape(fnamemodify(g:uncrustify_cfg_file_path, ':p')))
endfunction

function! UncrustifyAuto()
    if g:uncrustify_lang !=# ''
        call Uncrustify(g:uncrustify_lang)
    endif
endfunction

" }}}
" fix resolution files {{{

command! FixResolutionFiles call FixResolutionFiles()
function! FixResolutionFiles()
    let l:csprojFiles = systemlist('find ' . getcwd() . ' -name "*.csproj"')
    for csproj in l:csprojFiles
        let l:command = 'sed -i ''s/C:/\\mnt\\c/g'' ' . csproj
        call system(l:command)
    endfor
    :LspStopServer
endfunction

" }}}
" }}}
" python3_host_prog {{{
if has('mac')
    let g:python3_host_prog = '/usr/local/bin/python3'
endif
" }}}
" load plugins {{{

call plug#begin()

" looks {{{ 
Plug 'nanotech/jellybeans.vim', { 'tag' : 'v1.7' }
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
" }}}
" filer {{{
Plug 'lambdalisue/vim-fern'
" }}}
" syntax {{{
" more
Plug 'sheerun/vim-polyglot', { 'tag' : 'v4.17.1' }

" }}}
" search plugin {{{
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" }}}
" completion plugin {{{
"
" windowsでneovideにてomnisharp-roslynを動かすためには
" vim-lsp-settingsのinstall処理に修正が必要。
" $LOCALAPPDATA/nvim-data/plugged/vim-lsp-settings/installer/install-omnisharp-lsp.cmd
" or shにてlatestではなくv1.39.8をいれるようにすること

Plug 'prabirshrestha/asyncomplete.vim' 
Plug 'prabirshrestha/asyncomplete-lsp.vim' 
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings' 
Plug 'mattn/vim-lsp-icons' 
" Plug 'github/copilot.vim'

" }}}
" utils plugin {{{
" コメントONOFF
Plug 'tyru/caw.vim'
" translation
Plug 'koron/codic-vim'
" fullscreen
Plug 'lambdalisue/vim-fullscreen'
" terminal&vim&tmux環境でCTRL+Hとかでシームレスにペイン移動 
Plug 'christoomey/vim-tmux-navigator'
" 検索時にmatch数と順番を表示する
Plug 'osyo-manga/vim-anzu'
" editorconfig
Plug 'editorconfig/editorconfig-vim'
" }}}
" other plugins {{{
Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-qfreplace'
Plug 'cohama/vim-insert-linenr'
Plug 'cohama/vim-hier'
Plug 'osyo-manga/shabadou.vim'
Plug 'hananana/lilycomment.vim', { 'for': 'cs' }
Plug 'vim-scripts/DoxygenToolkit.vim', { 'for': ['cpp', 'objcpp', 'objc'] } 
Plug 'kana/vim-altr', { 'for' : ['cpp', 'objcpp', 'objc'] }
Plug 'elzr/vim-json', { 'for' : ['json']}
Plug 'stephpy/vim-yaml', { 'for' : [ 'yaml' ] }
Plug 'vim-scripts/Align', { 'for' : [ 'csv' ] }
" }}}

call plug#end()
filetype plugin indent on

" }}}
" colorscheme {{{
syntax enable
colorscheme jellybeans
set background=dark
" }}}
" basic setting  {{{

set list
" leaderをspaceにする
let g:mapleader = "\<Space>"
let g:maplocalleader = '\'
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
" inoremap <ESC> <ESC>:set iminsert=0<CR>
" " let s:lastiminsert = 0
" " IMEの状態を保持しておく、置換モードではIMEの状態を保持しない
" " 置換モードではIMEの状態を保持しない。置換モードではIMEオフなので、置換モード後の挿入モードが常にIMEオフになることを避ける
" " autocmd InsertLeave * if v:insertmode !=# 'r' | let s:lastiminsert = &iminsert | set iminsert=0 | endif
" " IMEの状態を復帰する。改行時には続けてIMEオンのままにしたいため。
" " 挿入モード（IMEオン）→ノーマルモード→挿入モード（IMEオン）
" " となるが。これはむしろできなくていい
" " 置換モードではIMEの状態を復帰しない
" autocmd InsertEnter * if v:insertmode ==# 'i' | let &iminsert = s:lastiminsert | endif

"末尾に改行を追加しない
set nofixeol

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
" focusした時に外部から更新があったかチェック
autocmd vimrc WinEnter * checktime
" vimdiffを縦で割る
set diffopt=vertical
" previewを表示しない
set completeopt-=preview
" マーカー折りたたみ
set foldmethod=marker
" 補完ウィンドウは10項目まで
set pumheight=10 
" neovimの文字化け対策
set ttimeout
set ttimeoutlen=50
" help
set helplang=en
" markdownのfiletype設定
autocmd vimrc BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

autocmd vimrc QuickFixCmdPost make,grepadd,grep,vimgrep if len(getqflist()) != 0 | copen | endif
" terminalモードでESCでもどる
tnoremap <silent> <ESC> <C-\><C-n>
" 左端に出るマークを消す
set signcolumn=no

"}}}
" keymaps {{{

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
"検索結果を画面中央にもってきてstatuslineに位置表示
nmap n <Plug>(anzu-n-with-echo)zz
nmap N <Plug>(anzu-N-with-echo)zz
nmap * <Plug>(anzu-star-with-echo)zz
nmap # <Plug>(anzu-sharp-with-echo)zz
" こっから<Leader>関連いくぜ！
" タブとウィンドウ分割"
nnoremap <Leader>s :<C-u>sp<CR>
nnoremap <Leader>v :<C-u>vs<CR>
" ヘッダーとの移動
autocmd vimrc FileType cpp,objc,objcpp nmap <Leader>i <Plug>(altr-forward)
" コメントテンプレ展開
autocmd vimrc FileType cs nnoremap <Leader>/ :LilyComment<CR>
autocmd vimrc FileType cpp,objc,objcpp nnoremap <Leader>/ :Dox<CR>
"コメントアウト
nmap <Leader>c <Plug>(caw:zeropos:toggle)
vmap <Leader>c <Plug>(caw:zeropos:toggle)
" レジスタ汚染防止
nnoremap x "_x
nnoremap s "_s
" help
nnoremap <Leader>h :<C-u>vertical belowright help<Space>
" Oで改行
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j
" Yで現在のカーソルから行末までヤンク
nnoremap Y y$

nnoremap <Leader>gg :grep 
nnoremap <Leader>gc :grep <cword>
nnoremap <Leader>f <Plug>:FixResolutionFiles<CR>
" }}}
" plugins setting {{{
" itchyny/lightline.vim {{{

let separator = {}
let subseparator = {}

if has('win64')
    let sepearator = { 'left': '', 'right': '' }
    let subseparator = { 'left': '', 'right': '' }
else
    let separator = { 'left': '', 'right': '' }
    let subseparator = { 'left': '', 'right': '' }
endif

let g:lightline = {
            \ 'colorscheme' : 'jellybeans',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'relativepath', 'anzu' ] ]
            \ },
            \ 'component' : {
            \   'anzu' : '%{anzu#search_status()}',
            \ },
            \ 'component_function': {
            \   'readonly' : 'MyReadOnly',
            \   'modified' : 'MyModified',
            \ },
            \ 'component_visible_condition': {
            \   'readonly': '(&filetype!="help"&& &readonly)',
            \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
            \ },
            \ 'separator' : separator,
            \ 'subseparator' : subseparator
            \ }

function! MyModified()
    return &filetype =~# 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
    return &filetype !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

" }}}
" junegunn/fzf.vim {{{
nnoremap <Leader><Leader> :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
" }}}
" ryanoasis/vim-devicons {{{
let g:webdevicons_enable_ctrlp = 1

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" file-icons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['cs'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['swift'] = ''
" }}}
" thinca/vim-quickrun {{{
nnoremap <Leader>q :<C-u>QuickRun<CR>
function! GetSolutionPath()
    return system('find . -maxdepth 3 -name "*.sln"')
endfunction
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config['_'] = {
            \ 'runner' : 'vimproc',
            \ 'runner/vimproc/updatetime' : 1,
            \ 'outputter' : 'multi:buffer:quickfix',
            \ 'outputter/buffer/close_on_empty' : 1,
            \ 'outputter/buffer/split' : 'botright',
            \ 'outputter/quickfix/into' : 1,
            \ 'hook/echo/enable' : 1,
            \ 'hook/echo/output_success' : 'SUCCESS  ',
            \ 'hook/echo/output_failure' : 'FAILURE  ',
            \ 'hook/inu/enable' : 1,
            \ 'hook/inu/wait' : 1
            \}
let g:quickrun_config.cs = { 'type' : 'msbuild' }
let g:quickrun_config.msbuild = {
            \ 'command' : 'msbuild',
            \ 'exec' : '%c %o',
            \ 'quickfix/error': '%f\\(%l\\,%c\\)%m', 
            \ 'cmdopt' : GetSolutionPath() . '-noLogo -verbosity:quiet -property:WarningLevel=1', 
            \ 'outputter' : 'quickfix'
            \ }
" }}}
" elzr/vim-json {{{
let g:vim_json_syntax_conceal = 0
" }}}
" iamcco/markdown-preview.vim' {{{
let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
" }}}
" chrisbra/csv.vim' {{{
let g:csv_delim=','
" }}}
" prg {{{
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" }}}
" vim-lsp {{{

" NOTE: http://blog.sbfm.jp/archives/71
" なんかおかしかったらログ出せ
" let g:lsp_log_file = expand('~/vim-lsp.log')

" }}}
" vim-lsp-settings {{{
" swift書くには明確なパスが必要。環境毎に書き換える気？マジ？
" let g:lsp_settings = {'sourcekit-lsp': {'cmd': ['xcrun', '--toolchain', 'org.swift.532202012141a', 'sourcekit-lsp']}}

" }}}
" fern {{{
let g:fern#renderer = "devicons"
"}}}
