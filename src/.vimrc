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
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'tsukkee/unite-tag'
Plug 'Shougo/neomru.vim'
Plug 'tyru/caw.vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/syntastic'
Plug 'rizzatti/dash.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/vimfiler'
Plug 'thinca/vim-qfreplace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'thinca/vim-quickrun'
Plug 'tsukkee/unite-help'

" scheme 
Plug 'joshdick/onedark.vim'

" my plugin
Plug 'hananana/lilycomment.vim', {'for': ['cs'] }

" completion
Plug 'Shougo/neocomplete.vim'
Plug 'OmniSharp/omnisharp-vim',{
            \'for': ['cs'],
            \'dir': '~/.vim/plugged/omnisharp-vim/',
            \'do' : 'xbuild server/OmniSharp.sln'}
Plug 'tpope/vim-dispatch'
Plug 'hananana/clang_complete', {
            \'for': ['cpp', 'objc', 'objcpp'],
            \'dir': '~/.vim/plugged/clang_complete/',
            \'do' : 'make'}
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'artur-shaik/vim-javacomplete2', { 'for': [ 'java' ] }
Plug 'osyo-manga/vim-monster', {'for': ['ruby'] }
Plug 'fatih/vim-go', {'for': ['go']}

" syntax
Plug 'OrangeT/vim-csharp', { 'for':  [ 'cs', 'csi', 'csx' ]  }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['cpp'] }
Plug 'b4winckler/vim-objc', { 'for': ['objc'] }
Plug 'keith/swift.vim'
Plug 'vim-scripts/ShaderHighLight'

" other
Plug 'vim-scripts/DoxygenToolkit.vim', { 'for' : ['cpp', 'objcpp', 'objc'] } 
Plug 'kana/vim-altr', {'for' : ['cpp', 'objcpp', 'objc'] }
Plug 'elzr/vim-json', {'for' : ['json']}
Plug 'kannokanno/previm', { 'for' : [ 'markdown' ] }
Plug 'stephpy/vim-yaml', { 'for' : [ 'yaml' ] }
Plug 'chrisbra/csv.vim'
Plug 'vim-scripts/Align', { 'for' : [ 'csv' ] }
Plug 'aklt/plantuml-syntax'
Plug 'soramugi/auto-ctags.vim'

call plug#end()
filetype plugin indent on

set rtp+=~/.vim/
runtime! settings/*.vim
runtime! settings/plugins/*.vim
runtime! settings/snippets/*.vim

" -------------------------------
" scheme
" -------------------------------
let g:onedark_termcolors=16
syntax enable
colorscheme onedark

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
" csv.vim
" --------------------------------
let g:csv_delim=','