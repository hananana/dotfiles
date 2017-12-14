
# check and install commands {{{
type -q fisher; or echo 'install fisher'
type -q ghq; or echo 'install ghq'
type -q go; or echo 'install go'
type -q fzy; or echo 'install fzy'
type -q rg; or echo 'install rg'
type -q balias; or echo 'install balias'
# }}}

# path {{{
set -x GOPATH $HOME
set -x PATH $HOME/bin $PATH
set -x PATH $HOME/.dotfiles/bin $PATH
# }}}

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
    echo -n "$glyphs[$ran] $PWD "

    if test -e $PWD/.git
        set_color white -b black
        echo -n ''
        set_color black -b white
        echo -n '  '
        echo -n (git_current_branch_name)
        set_color white -b black
        echo -n ''
        set_color -b normal
    end

    set_color -o yellow
    echo -n " >"
    set_color -o blue
    echo -n ">"
    set_color -o green
    echo -n "> "
end

# promptのI表示を消す
function fish_mode_prompt
end
# }}}

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
    eval $temp
end

function fzy_recursive
    find -L . | fzy | read temp
    commandline -a $temp
end

function fzy_branch
    git branch -a --sort=-authordate | cut -b 3- | perl -pe 's#^remotes/origin/###' | perl -nlE 'say if !$c{$_}++' | grep -v -- "->" | fzy | read -l temp
    commandline -a $temp
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
# }}}

# }}}
