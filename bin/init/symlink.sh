#!/bin/bash

dotDir=$HOME/.dotfiles/src
cd $dotDir
    
for file in `ls -A`; do
    if [ -e $HOME/$file ]; then
        rm $HOME/$file
    fi
    ln -s $dotDir/$file $HOME/$file
done

