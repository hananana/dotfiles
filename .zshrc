# -------------------------------------
# prompt
# -------------------------------------
autoload -Uz vcs_info
autoload -Uz colors # black red green yellow blue magenta cyan white
colors

# PROMPT変数内で変数参照
setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true #formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr "%F{green}!" #commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+" #add されていないファイルがある
zstyle ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f" #通常
zstyle ':vcs_info:*' actionformats '[%b|%a]' #rebase 途中,merge コンフリクト等 formats 外の表示

# プロンプト表示直前に vcs_info 呼び出し
precmd () { vcs_info }

PROMPT='%~ ${vcs_info_msg_0_} %F{white}>>>%f '

# -------------------------------------
# keybind&alias
# -------------------------------------

# ls
alias ls="ls -GF"
alias l='ls -lah'
alias la='ls -lAh'

# git
alias g='git'
alias gf='git fetch -p'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch --prune'
alias gfp='git fetch -p'
alias gl='git pull'
alias gm='git merge'
alias gp='git push'
alias gst='git status'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'

# tree
alias tree="tree -NC" # N: 文字化け対策, C:色をつける
# vim
alias vi="vim"
# tmux
alias tmux="TERM=screen-256color-bce tmux"
# ag
alias agm='ag -S --hidden -g'
# 通知
alias notice='~/.dotfiles/scripts/notice.sh'
#fuck
alias fuck='eval $(thefuck $(fc -ln -1))'
#attendance
alias hello='ruby ~/.dotfiles/scripts/attendance.rb hello'
alias confirm='ruby ~/.dotfiles/scripts/attendance.rb confirm'
alias bye='ruby ~/.dotfiles/scripts/attendance.rb bye'
#ag
alias ag='ag -S'
#oepn
alias o='open'

# 一文字alias
alias -g G='| grep'
alias -g P='| peco'
alias -g K='kill-process'
alias -g B='"$(git_current_branch_name)"'
alias -g M='git fetch --prune && git checkout master && git pull origin B && git "$(delete_merged_branches)"'

function git_current_branch_name()
{
    git branch | grep '^\*' | sed 's/^\* *//'
}

function delete_merged_branches()
{
    git branch -d `git branch --merged | grep -v '^*' | grep -v 'master' | tr -d '\n'`
}

# archive
function extract() {
    case $1 in
        *.tar.gz|*.tgz) tar xzvf $1;;
        *.tar.xz) tar Jxvf $1;;
        *.zip) unzip $1;;
        *.lzh) lha e $1;;
        *.tar.bz2|*.tbz) tar xjvf $1;;
        *.tar.Z) tar zxvf $1;;
        *.gz) gzip -d $1;;
        *.bz2) bzip2 -dc $1;;
        *.Z) uncompress $1;;
        *.tar) tar xvf $1;;
        *.arj) unarj $1;;
    esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

# ファイルを一括リネーム 
autoload -Uz zmv
alias zmv='noglob zmv -W'

# ctags
alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'

# フォルダ履歴から絞り込む
function peco-cdr () {
    local selected_dir=$(cd | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
bindkey '^f' peco-cdr

# ブランチを絞り込む
function git-branch(){
    local branch=$(git branch -a | peco | tr -d ' ' | tr -d '*')
    if [ -n "$branch" ]; then
        if [ -n "$LBUFFER" ]; then
            local new_left="${LBUFFER%\ } $branch"
        else
            local new_left="$branch"
        fi
        BUFFER=${new_left}${RBUFFER}
        CURSOR=${#new_left}
    fi
}
zle -N git-branch
bindkey '^g' git-branch

# ハッシュを絞り込む
function git-hash(){                                    
    git log --oneline --branches | peco | awk '{print $1}'
}  
zle -N git-hash
bindkey '^h' git-hash

# ヒストリを絞り込む
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history 

#アプリを終了させる
function kill-process () {
    ps -ef | peco | awk '{ print $2 }' | xargs kill
    zle clear-screen
}
# zle -N kill-process
# bindkey '^k' kill-process   # C-x k

#グラフ描画
function graph {
	git log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)― %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative
}

# -------------------------------------
# ruby
# -------------------------------------
eval "$(rbenv init -)"

# -------------------------------------
# zplug
# -------------------------------------
source ~/.zplug/zplug
zplug "b4b4r07/enhancd", of:init.sh
ENHANCD_HOOK_AFTER_CD=l
zplug "zsh-users/zsh-syntax-highlighting", of:zsh-syntax-highlighting.zsh
zplug "zsh-users/zsh-completions", of:src
zplug "zsh-users/zsh-autosuggestions"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load --verbose

# -------------------------------------
# tmux自動起動
# -------------------------------------
if [ -z $TMUX ]; then
    if $(tmux has-session 2> /dev/null); then
        tmux -2 attach
    else
        tmux -2 new-session -s tmp
    fi
fi

# -------------------------------------
# others
# -------------------------------------
# 1: 補完の時にVimで言うsmartcaseにする
# 2: 例えばs.vでs*.v*なファイルを補完出来るようにする （『zshの本』P.154）
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|.=*'
