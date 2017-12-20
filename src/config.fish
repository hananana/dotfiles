# function {{{

# cd {{{
set CD_HISTORY_FILE $HOME/.cd_history_file
test -e $CD_HISTORY_FILE; or touch $CD_HISTORY_FILE

function cd
    if test (count $argv) -eq 0
        cd_by_history
        return
    else if test (count $argv) -eq 1
        builtin cd $argv[1]
    else
        return
    end

    echo $PWD >> $CD_HISTORY_FILE 
    show_dir_info
    awk '!a[$0]++' $CD_HISTORY_FILE >/dev/null 2>&1
end

function cd_by_history 
    sort $CD_HISTORY_FILE | uniq -c | sort -r | sed -e 's/^[ ]*[0-9]*[ ]*//' | fzy | read -l cdHistory
    if [ $cdHistory ]
        cd $cdHistory
        commandline -f repaint
    else
        commandline ''
    end
end

function cdg
    cd (ghq list -p | fzy)
    show_dir_info
end

# }}}

# fzy {{{
function fzy_history
    history | fzy | read temp
    and eval $temp
end

function fzy_recursive
    find -L . | fzy | read temp
    and commandline -a $temp
end

function fzy_branch
    git branch -a --sort=-authordate | cut -b 3- | perl -pe 's#^remotes/origin/###' | perl -nlE 'say if !$c{$_}++' | grep -v -- "->" | fzy | read -l temp
    and commandline -a $temp
end

function show_dir_info
    echo '------------------------'
    echo ''
    custom_ls
    echo ''
    echo '------------------------'
    if test -e $PWD/.git
        echo ''
        git status
        echo ''
        echo '------------------------'
    end
end
# }}}

# zatsu {{{
function custom_ls
    switch (uname)
        case Linux
            # NOTE: ubuntuだとみづらいねん    
            ls --color=never -XlAh
        case Darwin
            /usr/local/bin/gls --color -XlAh
    end
end

function git_current_branch_name
    git branch | grep '^\*' | sed 's/^\* *//'
end

function update_symlink
    rm -rf $HOME/.vimrc
    ln -s $DOTDIR/src/vimrc $HOME/.vimrc
    rm -rf $HOME/.vim
    ln -s $DOTDIR/src/vim $HOME/.vim
    rm -rf $HOME/.commit_template.txt
    ln -s $DOTDIR/src/commit_template.txt $HOME/.commit_template.txt
    rm -rf $HOME/.gitconfig
    ln -s $DOTDIR/src/gitconfig $HOME/.gitconfig
    rm -rf $HOME/.gitignore_global
    ln -s $DOTDIR/src/gitignore_global $HOME/.gitignore_global
    rm -rf $HOME/.tigrc
    ln -s $DOTDIR/src/tigrc $HOME/.tigrc
    rm -rf $HOME/.tmuxinator
    ln -s $DOTDIR/src/tmuxinator $HOME/.tmuxinator
    rm -rf $HOME/.uncrustifyconfig
    
    rm -rf $HOME/.tmux.conf
    switch (uname)
        case Linux
            ln -s $DOTDIR/src/tmux.conf.ubuntu $HOME/.tmux.conf
        case Darwin
            ln -s $DOTDIR/src/tmux.conf $HOME/.tmux.conf
    end


end

# disappear greeting
function fish_greeting
end

# blue bold echo
function becho
    echo -e "\033[1;34m$argv[1]\033[0;39m"
end

# red bold echo
function recho
    echo -e "\033[1;31m$argv[1]\033[0;39m"
end
# }}}

# installer {{{
function install_fisher
    becho 'Install fisher...'
    recho 'not implement yet'
end

function install_go
    becho 'Install go...'
    recho 'not implement yet'
end

function install_ghq
    becho 'Install ghq...'
    recho 'not implement yet'
end

function install_fzy
    becho 'Install fzy'
    recho 'not implement yet'
end

function install_rg
    becho 'Install rg...'
    recho 'not implement yet'
end

function install_balias
    becho 'Install balias...'
    fisher omf/balias
end


function install_vim
    becho 'Install vim...'
    set startDir $PWD
    set vimDir (ghq root)/github.com/vim/vim
    test -e $vimDir
    and becho 'found vim src...!'
    or echo ghq get vim/vim

    becho 'git pull'
    git pull > /dev/null 2>&1

    git -C $vimDir tag | tail -n 1 | read -l vimTag
    becho 'newest tag is '$vimTag
    git -C $vimDir checkout $vimTag > /dev/null 2>&1

    becho 'make distclean...'
    builtin cd $vimDir/src
    and make distclean
    and ./configure --enable-fail-if-missing --enable-pythoninterp --enable-rubyinterp --enable-terminal --enable-multibyte --enable-fontset --enable-cscope
    and sudo make
    and sudo make install
    and builtin cd $startDir
    becho 'ready to vim!!!!!'
end

function install_library_for_vim_in_ubuntu
    becho 'cmake'
    becho 'mono'
end

function install_library_for_vim_in_mac
    becho 'cmake'
    becho 'mono'
end

function install_if_needed
    type -q go
    or install_go

    type -q ghq
    or install_ghq

    type -q fzy
    or install_fzy

    type -q rg
    or install_rg

    type -q fisher
    or install_fisher

    type -q balias
    or install_balias

    vim --version | grep +python | read -l hasPythonVim
    test -z $hasPythonVim
    and install_vim
end
# }}}

# }}}
# path {{{
set -x GOPATH $HOME
set -x DOTDIR $HOME/src/github.com/hananana/dotfiles
set -x PATH $HOME/bin $PATH
set -x PATH $DOTDIR/bin $PATH
# }}}
# bind {{{
function fish_user_key_bindings
    bind \cr fzy_history
    bind \cf fzy_recursive
    bind \cg fzy_branch
    if bind -M insert >/dev/null ^/dev/null
        bind -M insert \cr fzy_history
        bind -M insert \cf fzy_recursive
        bind -M insert \cg fzy_branch
    end
end
# }}}
# prompt {{{
function fish_prompt
    set -l glyphs ' ' ' ' ' ' ' ' ' ' ' '
    set -l ran (random 1 (count $glyphs))
    echo -n " $glyphs[$ran] $PWD "

    if test -e $PWD/.git
        set_color FFFFFF -b black
        echo -n ''
        set_color black -b FFFFFF
        echo -n '   '
        echo -n (git_current_branch_name)' '
        set_color FFFFFF -b black
        echo -n ''
        set_color normal -b normal
    end

    set_color -o FFFF00 
    echo -n " >"
    set_color -o 0000FF
    echo -n ">"
    set_color -o 008000
    echo -n "> "
end

# promptのI表示を消す
function fish_mode_prompt
end
# }}}

install_if_needed

# alias {{{
balias gst 'git status'
balias gf 'git fetch --prune'
balias gfp 'git fetch --prune'
balias ga 'git add'
balias gaa 'git add --all'
balias gb 'git branch'
balias gba 'git branch -a'
balias gc 'git commit -v'
balias gcb 'git checkout -b'
balias gco 'git checkout'
balias gd 'git diff'
balias gl 'git pull --prune'
balias gp 'git push'
balias gpu 'git push -u origin (git_current_branch_name)'
balias grh 'git reset HEAD'
balias grhh 'git reset HEAD --hard'
balias gd 'git diff'
balias mux 'tmuxinator'
balias o 'open'
balias tree 'tree -NC'
balias l show_dir_info

# }}} 
