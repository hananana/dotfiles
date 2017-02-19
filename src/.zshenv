# zmodload zsh/zprof && zprof

export EDITOR=vim

# -------------------------------------
# path
# -------------------------------------

# rbenv
PATH=$PATH:"$HOME/.rbenv/bin"

# android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH=$PATH":$ANDROID_HOME/platform-tools"
export PATH=$PATH":$ANDROID_HOME/tools"

# go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# my script
export PATH=$PATH:$HOME/.dotfiles/bin

# -------------------------------------
# Javaのswitch
# brew caskでいれたjavaの場所virtualMachine?のナンバーを指定
# -------------------------------------
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# -------------------------------------
# ls
# -------------------------------------

autoload colors
colors

export LSCOLORS=gxfxcxdxbxegedabagacag
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'

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
# fzf
# -------------------------------------
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
