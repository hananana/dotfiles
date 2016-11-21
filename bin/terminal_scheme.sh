#!/bin/bash

APPDIR=$HOME/.dotfiles/app
SCHEMEDIR=$APPDIR/gruvbox-terminal

if [ ! -e $APPDIR ]; then
    mkdir -p $APPDIR
fi

if [ ! -e $SCHEMEDIR ]; then
    git clone git@github.com:flipxfx/gruvbox-terminal.git $SCHEMEDIR
fi

open $SCHEMEDIR/gruvbox-dark.terminal
defaults write com.apple.Terminal Default\ Window\ Settings -string gruvbox-dark
osascript -e "tell application \"Terminal\" to set the font name of window 1 to \"mplus Nerd Font\""
osascript -e "tell application \"Terminal\" to set the font size of window 1 to 12"
