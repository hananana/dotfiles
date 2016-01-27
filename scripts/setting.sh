#/bin/sh
DOTFILES_DIR=".dotfiles"

# gitconfig
if [ -e ~/.gitconfig ]; then
    rm -f ~/.gitconfig
fi
ln -s ~/$DOTFILES_DIR/.gitconfig ~/.gitconfig

# gitglobal
if [ -e ~/.gitignore_global ]; then
    rm -f ~/.gitignore_global
fi
ln -s ~/$DOTFILES_DIR/.gitignore_global ~/.gitignore_global

# zshrc
if [ -e ~/.zshrc ]; then
    rm -f ~/.zshrc
fi
ln -s ~/$DOTFILES_DIR/.zshrc ~/.zshrc

# vimrc
if [ -e ~/.vimrc ]; then
    rm -f ~/.vimrc
fi
ln -s ~/$DOTFILES_DIR/.vimrc ~/.vimrc

# xvimrc
if [ -e ~/.xvimrc ]; then
    rm -f ~/.xvimrc
fi
ln -s ~/$DOTFILES_DIR/.xvimrc ~/.xvimrc

# vim directory
if [ -e ~/.vim ]; then
    rm -rf ~/.vim
fi
ln -s ~/$DOTFILES_DIR/.vim ~/.vim

# tmux
if [ -e ~/.tmux.conf ]; then
    rm -rf ~/.tmux.conf
fi
ln -s ~/$DOTFILES_DIR/.tmux.conf ~/.tmux.conf

# tmuxinator
if [ -e ~/.tmuxinator ]; then
    rm -rf ~/.tmuxinator
fi
ln -s ~/$DOTFILES_DIR/.tmuxinator ~/.tmuxinator

# iterm
if [ -e ~/iTerm2-Color-Schemes ]; then
    rm -rf ~/iTerm2-Color-Schemes
fi

ln -s ~/$DOTFILES_DIR/iTerm2-Color-Schemes ~/iTerm2-Color-Schemes

# ctags
if [ -e ~/.ctags ]; then
    rm -rf ~/.ctags
fi
ln -s ~/$DOTFILES_DIR/.ctags ~/.ctags

# neobundle
if [ ! -e ~/.vim/bundle ]; then
    mkdir ~/.vim/bundle
fi

if [ ! -e ~/.vim/bundle/neobundle.vim ]; then
    git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi
