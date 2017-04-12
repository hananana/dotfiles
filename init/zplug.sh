#!/bin/zsh

if [ -e ~/.zplug ]; then
    echo "zplug already installed"
else
    git clone https://github.com/b4b4r07/zplug ~/.zplug
fi
