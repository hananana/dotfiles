# clone and configure and make and make install VIM
set startDir $PWD
set vimDir (ghq root)/github.com/vim/vim
test -e $vimDir
and echo 'found vim src...!'
or echo ghq get vim/vim

echo 'wait some seconds. git pull....'
spin 'git pull > /dev/null 2>&1'

git -C $vimDir tag | tail -n 1 | read -l vimTag
echo 'complete'
echo 'newest tag is '$vimTag
git -C $vimDir checkout $vimTag > /dev/null 2>&1

echo 'make distclean...'
builtin cd $vimDir/src
and make -C $vimDir/src distclean
and ./configure --enable-fail-if-missing --enable-pythoninterp --enable-rubyinterp --enable-terminal --enable-multibyte --enable-fontset --enable-cscope
and sudo make
and sudo make install
and builtin cd $startDir
