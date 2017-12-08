#!/bin/zsh

# tpm
echo 'checking tpm'
tpmPath=~/.tpm
if [ -e $tpmPath ]; then
    echo 'tpm.... OK'
else
    echo 'install tpm'
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# checking os
# if [ $(echo $OSTYPE | grep -e 'linux') ]; then
#     echo linux
# fi

# python

# go

# ghq

# ruby

# gem

# tmux

# tmuxinator

# .zgen

# rg

# fzy


# shellcheck

# prepare vim
sudo apt install build-essential python-dev ruby-dev
# for YouCompleteMe
sudo apt install cmake
# for mono
sudo add-apt-repository ppa:ermshiperete/monodevelop
sudo apt update
sudo apt install monodevelop-current mono-xbuild mono-complete

ghq get hananana/dotfiles
DOTFILESRC=$HOME/src/github.com/hananana/dotfiles/src
ln -s $DOTFILESRC/vimrc $HOME/.vimrc
ln -s $DOTFILESRC/zshrc $HOME/.zshrc

ghq get vim/vim

$HOME/src/github.com/vim/vim/src/configure --enable-if-missing --enable-pythoninterp --enable-rubyinterp --enbale-multibyte --enable-fontset --enable-terminal

# vint
echo 'checking vint'
if [ -x "`which vint`" ]; then
    echo 'vint.... OK'
else
    sudo pip install vim-vint
fi
