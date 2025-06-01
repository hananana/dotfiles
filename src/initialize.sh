#!/bin/zsh

# ANSI カラー定義
RED=$'\e[31m'
GREEN=$'\e[32m'
YELLOW=$'\e[33m'
BLUE=$'\e[96m'
RESET=$'\e[0m'

# brew
if ! command -v brew >/dev/null 2>&1; then
    echo "${YELLOW}brew が見つかりません。Homebrew を使ってインストールします。${RESET}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "${GREEN}brew は既にインストールされています。${RESET}"
fi

# wget
if ! command -v wget >/dev/null 2>&1; then
    echo "${YELLOW}wget が見つかりません。Homebrew を使ってインストールします。${RESET}"
    brew install wget
else
    echo "${GREEN}wget は既にインストールされています。${RESET}"
fi

# wget
if ! command -v tig >/dev/null 2>&1; then
    echo "${YELLOW}tig が見つかりません。Homebrew を使ってインストールします。${RESET}"
    brew install tig
else
    echo "${GREEN}tig は既にインストールされています。${RESET}"
fi

# python
if ! command -v python >/dev/null 2>&1; then
    echo "${YELLOW}python が見つかりません。Homebrew を使ってインストールします。${RESET}"
    brew install pyenv
    # pythonにはこれが必要
    brew install xz
    pyenv install 3.13.3
    pyenv global 3.13.3
else
    echo "${GREEN}python は既にインストールされています。${RESET}"
fi

# nvim
if ! command -v nvim >/dev/null 2>&1; then
    echo "${YELLOW}nvim が見つかりません。Homebrew を使ってインストールします。${RESET}"
    brew install nvim
else
    echo "${GREEN}nvim は既にインストールされています。${RESET}"
fi

# $HOME/.configを生成
if [[ ! -d "$HOME/.config" ]]; then
	mkdir -p "$HOME/.config"
fi

link "$HOME/src/github.com/hananana/dotfiles/src/zshrc" "$HOME/.zshrc"
link "$HOME/src/github.com/hananana/dotfiles/src/gitconfig" "$HOME/.gitconfig"
link "$HOME/src/github.com/hananana/dotfiles/src/commit_template.txt" "$HOME/.commit_template.txt"
link "$HOME/src/github.com/hananana/dotfiles/src/nvim" "$HOME/.config/nvim"

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

exec zsh

echo "${GREEN}iTerm2>Settings>General>Settings>ExternalSettingsに$HOME/src/github.com/hananana/dotfiles/srcを指定してください${RESET}"

link() {
  local source="$1"
  local target="$2"

  if [ -z "$source" ] || [ -z "$target" ]; then
    echo "Usage: link_dotfile <source> <target>"
    return 1
  fi

  if [ -e "$target" ] || [ -L "$target" ]; then
    echo "${BLUE}既存のファイルを削除します: $target${RESET}"
    rm -f "$target"
  fi

  ln -s "$source" "$target"
  echo "${BLUE}シンボリックリンクを作成しました: $target → $source${RESET}"
}
