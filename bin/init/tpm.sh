#!/bin/bash

tpmDir=$HOME/.tmux/plugins/tpm
if ! [ -e  $tpmDir ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
