#!/bin/zsh

# need commands
echo 'checking commands'
if [ -x "`which git`" ]; then
    echo 'git.... OK'
else
    echo 'PLZ install git'
    return 2> /dev/null
fi

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
