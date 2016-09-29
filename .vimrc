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
Plug 'Shougo/neocomplete.vim' 
Plug 'tyru/caw.vim'
Plug 'majutsushi/tagbar'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/syntastic'
Plug 'xolox/vim-session' | Plug 'xolox/vim-misc'
Plug 'rizzatti/dash.vim'
Plug 'lambdalisue/vim-gita'
Plug 'kana/vim-smartchr'
Plug 'Chiel92/vim-autoformat'
Plug 'mopp/layoutplugin.vim'

" self
Plug 'hananana/lilycomment.vim'

" scheme
Plug 'altercation/vim-colors-solarized'

" complete
" Plug 'Valloric/YouCompleteMe', {'dir': '~/.vim/plugged/YouCompleteMe', 'do' : './install.py --clang-completer --omnisharp-completer'}
Plug 'https://github.com/SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'artur-shaik/vim-javacomplete2', { 'for': [ 'java' ] }
Plug 'ervandew/eclim', { 'for': [ 'ruby' ] }

Plug 'Shougo/neocomplete.vim'
Plug 'OmniSharp/omnisharp-vim', {'dir': '~/.vim/plugged/omnisharp-vim/', 'do' : 'xbuild server/OmniSharp.sln'}
Plug 'tpope/vim-dispatch'

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

source ~/.vim/settings/basic.vim
source ~/.vim/settings/keymap.vim
set rtp+=~/.vim/settings/
runtime! plugins/*.vim

" -------------------------------
" scheme
" -------------------------------

let g:solarized_termcolors=256
let g:solarized_termtrans=1
syntax enable
set background=dark
colorscheme solarized

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
" plantuml
" --------------------------------
let g:plantuml_excutable_script="~/.dotfiles/scripts/make_uml"

" --------------------------------
" javacomplete2
" --------------------------------
autocmd vimrc FileType java setlocal omnifunc=javacomplete#Complete

" --------------------------------
" vim-autoformat
" --------------------------------
let g:formatdef_my_custom_cs = '"astyle --style=allman"'
let g:formatters_cs = ['my_custom_cs']
" autocmd vimrc BufWrite *.cs :Autoformat
