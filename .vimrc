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

" must
Plug 'Shougo/vimproc.vim', {'dir': '~/.vim/plugged/vimproc.vim', 'do': 'make'}
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
Plug 'rizzatti/dash.vim'
Plug 'lambdalisue/vim-gita'
Plug 'Chiel92/vim-autoformat'

" my plugin
Plug 'hananana/lilycomment.vim'

" scheme
Plug 'altercation/vim-colors-solarized'
Plug 'w0ng/vim-hybrid'

" completion
Plug 'Shougo/neocomplete.vim'
Plug 'OmniSharp/omnisharp-vim',{
            \'for': ['cs'],
            \'dir': '~/.vim/plugged/omnisharp-vim/',
            \'do' : 'xbuild server/OmniSharp.sln'}
Plug 'tpope/vim-dispatch'
Plug 'Rip-Rip/clang_complete', {
            \'for': ['cpp', 'objc', 'objcpp'],
            \'dir': '~/.vim/plugged/clang_complete/',
            \'do' : 'make'}
Plug 'https://github.com/SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'artur-shaik/vim-javacomplete2', { 'for': [ 'java' ] }
Plug 'osyo-manga/vim-monster', {'for': ['ruby'] }

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

" only ruby
Plug 'tpope/vim-endwise'
Plug 'thinca/vim-ref'
Plug 'yuku-t/vim-ref-ri'

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
syntax enable
set background=dark
colorscheme hybrid

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
" vim-autoformat
" --------------------------------
let g:formatdef_my_custom_cs = '"astyle --style=allman --keep-one-line-blocks"'
let g:formatters_cs = ['my_custom_cs']
" autocmd vimrc BufWrite *.cs :Autoformat

" --------------------------------
" vim-ref
" --------------------------------
let g:ref_no_default_key_mappings = 1

