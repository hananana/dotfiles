filetype plugin indent off

augroup vimrc
    autocmd!
augroup END

" -------------------------------
" vim-plug
" -------------------------------
if has('vim_starting')
    set runtimepath+=~/.vim/plugged/vim-plug
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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'LeafCage/yankround.vim'
Plug 'rking/ag.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tyru/caw.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'thinca/vim-quickrun'
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'

" Plug 'sbdchd/neoformat'
" Plug 'thinca/vim-qfreplace'

" scheme
Plug 'hara/ctrlp-colorscheme'
Plug 'jacoborus/tender.vim'
Plug '0xcharly/vim-frictionless'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
Plug 'wesgibbs/vim-irblack'

" for lightlight
Plug 'whatyouhide/gotham'

" my plugin
Plug 'hananana/lilycomment.vim', {'for': ['cs'] }

" completion
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer --omnisharp-completer'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'osyo-manga/vim-monster', {'for': ['ruby'] }
Plug 'fatih/vim-go', {'for': ['go']}
Plug 'artur-shaik/vim-javacomplete2'

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

Plug 'stephpy/vim-yaml', { 'for' : [ 'yaml' ] }

Plug 'chrisbra/csv.vim'

Plug 'vim-scripts/Align', { 'for' : [ 'csv' ] }

Plug 'aklt/plantuml-syntax'

Plug 'soramugi/auto-ctags.vim'

Plug 'iamcco/markdown-preview.vim', { 'for' : [ 'markdown' ] }

call plug#end()
filetype plugin indent on

set runtimepath+=~/.vim/
runtime! settings/*.vim
runtime! settings/plugins/*.vim
runtime! settings/snippets/*.vim

" -------------------------------
" scheme
" -------------------------------
syntax enable
colorscheme jellybeans
set background=dark

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
let g:plantuml_excutable_script='~/.dotfiles/scripts/make_uml'

" --------------------------------
" csv.vim
" --------------------------------
let g:csv_delim=','

" --------------------------------
" markdown-preview
" --------------------------------
let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"

