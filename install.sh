#!/usr/bin/env bash

function becho() {
    echo -e "\033[1;34m$1\033[0;39m"
}

function recho() {
    echo -e "\033[1;31m$1\033[0;39m"
}

function install_fish() {
    becho 'Install fish!'
    if type 'fish' > /dev/null 2>&1
    then
        becho 'already installed'
    else
        brew install fish
    fi
}

function install_brew() {
    becho 'Install HomeBrew!'
    if type 'brew' > /dev/null 2>&1
    then
        becho 'already installed'
    else
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
}

function setup_for_mac() {
    becho 'set up Mac!'
    install_brew
    install_fish
}

function setup_for_linux() {
    becho 'set up Linux!'
}

function main() {
    if [ "$(uname)" == 'Darwin' ]
    then
        setup_for_mac
    elif [ "$(uname)" == 'Linux' ]
    then
        setup_for_linux
    fi
}

# Let's GO!!!!
main
