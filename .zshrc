# -------------------------------------
# 環境変数
# -------------------------------------

# SSHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# -------------------------------------
# zshのオプション
# -------------------------------------

## 補完機能の強化
autoload -U compinit
compinit

## 入力しているコマンド名が間違っている場合にもしかして：を出す。
setopt correct

# ビープを鳴らさない
setopt nobeep

## 色を使う
setopt prompt_subst

## lsの色変更
## export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors \
'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

## ^Dでログアウトしない。
setopt ignoreeof

## バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify

## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

# 補完
## タブによるファイルの順番切り替えをしない
unsetopt auto_menu

# cd -[tab]で過去のディレクトリにひとっ飛びできるようにする
setopt auto_pushd

# ディレクトリ名を入力するだけでcdできるようにする
setopt auto_cd

# -------------------------------------
# プロンプト
# -------------------------------------

autoload -U promptinit; promptinit
autoload -Uz colors; colors
autoload -Uz vcs_info
autoload -Uz is-at-least

# begin VCS
zstyle ":vcs_info:*" enable git svn hg bzr
zstyle ":vcs_info:*" formats "(%s)-[%b]"
zstyle ":vcs_info:*" actionformats "(%s)-[%b|%a]"
zstyle ":vcs_info:(svn|bzr):*" branchformat "%b:r%r"
zstyle ":vcs_info:bzr:*" use-simple true

zstyle ":vcs_info:*" max-exports 6

if is-at-least 4.3.10; then
    zstyle ":vcs_info:git:*" check-for-changes true # commitしていないのをチェック
    zstyle ":vcs_info:git:*" stagedstr "<S>"
    zstyle ":vcs_info:git:*" unstagedstr "<U>"
    zstyle ":vcs_info:git:*" formats "(%b) %c%u"
    zstyle ":vcs_info:git:*" actionformats "(%s)-[%b|%a] %c%u"
fi

function vcs_prompt_info() {
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && echo -n " %{$fg[yellow]%}$vcs_info_msg_0_%f"
}
# end VCS

OK="^_^ "
NG="X_X "

PROMPT=""
PROMPT+="%(?.%F{green}$OK%f.%F{red}$NG%f) "
PROMPT+="%F{blue}%~%f"
PROMPT+="\$(vcs_prompt_info)"
PROMPT+="
"
PROMPT+="%% "

RPROMPT="[%*]"

# -------------------------------------
# エイリアス
# -------------------------------------

# -n 行数表示, -I バイナリファイル無視, svn関係のファイルを無視
alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"

# ls
alias ls="ls -G" # color for darwin
alias l="ls -a"
alias la="ls -la"
alias l1="ls -1"

# tree
alias tree="tree -NC" # N: 文字化け対策, C:色をつける

# ctags
alias ctags="`brew --prefix`/bin/ctags"

# -------------------------------------
# キーバインド
# -------------------------------------

bindkey -e

function cdup() {
   echo
   cd ..
   zle reset-prompt
}
zle -N cdup
bindkey '^K' cdup

bindkey "^R" history-incremental-search-backward

# -------------------------------------
# その他
# -------------------------------------

# cdしたあとで、自動的に ls する
function chpwd() { ls -1 }

# iTerm2のタブ名を変更する
function title {
    echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"
function chpwd() { echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"}
}

# -------------------------------------
# ヒストリー
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

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# -------------------------------------
# curl
# -------------------------------------
setopt nonomatch

# -------------------------------------
# peco
# -------------------------------------
#ディレクトリ移動
function pcd {
#   local dir="$( find . -maxdepth 1 -type d | sed -e 's;\./;;' | peco )"
#	local dir="$(ls -a | sed -e 's;\./;;' | peco)"
	local dir="$(ls -a | peco)"
    if [ ! -z "$dir" ] ; then
        cd "$dir"
    fi
}

#開く
function pop {
#    local dir="$( find . -maxdepth 1 -type d | sed -e 's;\./;;' | peco )"
#	local dir="$(ls -a | sed -e 's;\./;;' | peco)"
	local dir="$(ls -a | peco)"
#    if [ ! -z "$dir" ] ; then
        open "$dir"
#   fi
}

function peco-select-path {
	local filepath="$(ls -a | peco)"
  if [ "$LBUFFER" -eq "" ]; then
    if [ -d "$filepath" ]; then
      BUFFER="cd $filepath"
    elif [ -f "$filepath" ]; then
      BUFFER="open $filepath"
    fi
  else
    BUFFER="$LBUFFER$filepath"
  fi
  CURSOR=$#BUFFER
  zle clear-screen
}

if [ -x "`which peco 2> /dev/null`" ]; then
  zle -N peco-select-path
  bindkey '^f' peco-select-path # Ctrl+f で起動
fi

#ヒストリ検索
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

#アプリを終了させる
function peco-kill-process () {
    ps -ef | peco | awk '{ print $2 }' | xargs kill
    zle clear-screen
}
zle -N peco-kill-process
bindkey '^k' peco-kill-process   # C-x k

# ここからgit系
#
# g = git
# o = checkout
# p = pull
# pu = push
# puu = push -u
#

#ローカルブランチ削除
function pdlb {
     git branch -d $(git branch | sed -e "s/^\*\s*//g" | peco)
}

#リモートブランチ削除
function pdrb {
 	someBranch=$(git branch -a | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g")
 	git push --delete origin ${someBranch##*/}
}

function graph {
	git log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)― %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative
}

alias g='git'
alias -g B='`git branch -a | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'
alias -g R='`git remote | peco --prompt "GIT REMOTE>" | head -n 1`'

# -------------------------------------
# cd-bookmark
#https://github.com/mollifier/cd-bookmark
# -------------------------------------
fpath=($HOME/Utilities/cd-bookmark(N-/) $fpath)
autoload -Uz cd-bookmark
alias cdb='cd-bookmark'

# -------------------------------------
# cocos
# macを切り替えると通らんので注意！！
# -------------------------------------

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/hanazawa/Cocos2d-x/cocos2d-x/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/hanazawa/Cocos2d-x/cocos2d-x/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/Users/hanazawa/Android/android-ndk-r10c
export PATH=$NDK_ROOT:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/Users/hanazawa/Android/apache-ant-1.9.6/bin
export PATH=$ANT_ROOT:$PATH
# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/Users/hanazawa/Library/Android/sdk
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# -------------------------------------
# ruby
# -------------------------------------

eval "$(rbenv init -)"

# -------------------------------------
# パス
# -------------------------------------

# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath

# PATHの設定がぶっこわれーたのでなおし
export PATH=/usr/local/bin:/bin:/sbin:/usr/bin:/usr/sbin:$PATH


# -------------------------------------
# antigen
# -------------------------------------
source ~/antigen/antigen.zsh
antigen-bundle b4b4r07/enhancd
