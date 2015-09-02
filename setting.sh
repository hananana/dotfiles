#/bin/sh
DOTFILES_DIR=".dotfiles/dotfiles"

# gitconfig
if [ -e ~/.gitconfig ]; then
    rm -f ~/.gitconfig
fi
ln -s ~/$DOTFILES_DIR/.gitconfig ~/.gitconfig

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
if [ -d ~/.vim ]; then
    rm -rf ~/.vim
fi
ln -s ~/$DOTFILES_DIR/.vim ~/.vim
git submodule update --init

#schema
if [ -d ~/schema ]; then
    rm -rf ~/schema
fi
ln -s ~/$DOTFILES_DIR/schema ~/schema
