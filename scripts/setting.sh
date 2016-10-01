#!/bin/zsh
#!/bin/brew

DOTFILES_DIR=".dotfiles"

confirm_brew() 
{
    beers=`brew list`
    needBeers=(tmux tig tree the_silver_searcher plantuml graphviz peco rbenv vim cmake ctags gradle reattach-to-user-namespace astyle)
    for i in $needBeers; do
        if (( ${beers[(I)$i]} )); then
        else
            if [ $i = 'vim' ]; then
                brew install vim --with-client-server --with-lua
            else
                brew install $i
            fi
        fi
    done

    neadCasks=(karabiner eclipse-java appcleaner texturepacker alfred2 dash shiftit caffeine netbeans)
    for i in $needCasks; do
        if (( ${beers[(I)$i]} )); then
        else
            brew cask install $i
        fi
    done
}

set_symlink()
{
    # symlink
    ## gitconfig
    if [ -e ~/.gitconfig ]; then
        rm -f ~/.gitconfig
    fi
    ln -s ~/$DOTFILES_DIR/.gitconfig ~/.gitconfig

    ## gitglobal
    if [ -e ~/.gitignore_global ]; then
        rm -f ~/.gitignore_global
    fi
    ln -s ~/$DOTFILES_DIR/.gitignore_global ~/.gitignore_global

    ## zshrc
    if [ -e ~/.zshrc ]; then
        rm -f ~/.zshrc
    fi
    ln -s ~/$DOTFILES_DIR/.zshrc ~/.zshrc

    ## vimrc
    if [ -e ~/.vimrc ]; then
        rm -f ~/.vimrc
    fi
    ln -s ~/$DOTFILES_DIR/.vimrc ~/.vimrc

    ## gvimrc
    if [ -e ~/.gvimrc ]; then
        rm -f ~/.gvimrc
    fi
    ln -s ~/$DOTFILES_DIR/.gvimrc ~/.gvimrc

    ## xvimrc
    if [ -e ~/.xvimrc ]; then
        rm -f ~/.xvimrc
    fi
    ln -s ~/$DOTFILES_DIR/.xvimrc ~/.xvimrc

    ## vim directory
    if [ -e ~/.vim ]; then
        rm -rf ~/.vim
    fi
    ln -s ~/$DOTFILES_DIR/.vim ~/.vim

    ## tmux
    if [ -e ~/.tmux.conf ]; then
        rm -rf ~/.tmux.conf
    fi
    ln -s ~/$DOTFILES_DIR/.tmux.conf ~/.tmux.conf

    ## tmuxinator
    if [ -e ~/.tmuxinator ]; then
        rm -rf ~/.tmuxinator
    fi
    ln -s ~/$DOTFILES_DIR/.tmuxinator ~/.tmuxinator

    ## ctags
    if [ -e ~/.ctags ]; then
        rm -rf ~/.ctags
    fi
    ln -s ~/$DOTFILES_DIR/.ctags ~/.ctags

    ## tigrc
    if [ -e ~/.tigrc ]; then
        rm -rf ~/.tigrc
    fi
    ln -s ~/$DOTFILES_DIR/.tigrc ~/.tigrc
}

confirm_brew
set_symlink


## zplug
if [ -e ~/.zplug ]; then
    echo "zplug already installed"
else
    git clone https://github.com/b4b4r07/zplug ~/.zplug
fi

## karabiner
rm ~/Library/Application\ Support/Karabiner/private.xml
ln -s ~/.dotfiles/dotfiles/private.xml private.xml

## tmuxinator
gem install tmuxinator
