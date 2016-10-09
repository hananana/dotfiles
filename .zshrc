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
# ls
# -------------------------------------

autoload colors
colors

export LSCOLORS=gxfxcxdxbxegedabagacag
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'

# -------------------------------------
# path
# -------------------------------------

# rbenv
PATH="$HOME/.rbenv/bin:$PATH"

# android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH

# -------------------------------------
# history
# -------------------------------------

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

# tmuxのwindow,pane,session間で履歴を共有
setopt share_history

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
alias gfp0'git fetch -p'
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

alias -g K='kill-process'

alias -g F='git fetch --prune'
alias -g B='"$(git_current_branch_name)"'
# alias -g M='F && git checkout master && git pull origin B && git "$(delete_merged_branches)"'
alias -g S='git status'
alias -g C='git checkout'
alias -g N='git checkout -b'
alias -g D='git diff'
alias -g P='git push'
alias -g L='git pull'

function git_current_branch_name()
{
    git branch | grep '^\*' | sed 's/^\* *//'
}

# function delete_merged_branches()
# {
#     git branch -d `git branch --merged | grep -v '^*' | grep -v 'master' | tr -d '\n'`
# }

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

# ctags
alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'

bindkey '^r' anyframe-widget-execute-history
bindkey '^k' anyframe-widget-kill
bindkey '^i' anyframe-widget-insert-git-branch
bindkey '^h' git-hash

# ハッシュを絞り込む
function git-hash(){                                    
    git log --oneline --branches | peco | awk '{print $1}'
}  
zle -N git-hash

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
zplug "b4b4r07/enhancd", of:enhancd.sh
zplug "zsh-users/zsh-syntax-highlighting", of:zsh-syntax-highlighting.zsh
zplug "zsh-users/zsh-completions", of:src
zplug "mollifier/anyframe"

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


# -------------------------------------
# Javaのswitch
# brew caskでいれたjavaの場所virtualMachine?のナンバーを指定
# -------------------------------------
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
