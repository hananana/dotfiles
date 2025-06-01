#!/bin/zsh

# ANSI カラー定義
RED=$'\e[31m'
GREEN=$'\e[32m'
YELLOW=$'\e[33m'
BLUE=$'\e[96m'
RESET=$'\e[0m'

# シンボリックリンク
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

# コマンドのinstall
install() {
  local cmd="$1"
  local installer_func="$2"

  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "${YELLOW}${cmd} が見つかりません。インストールを試みます。${RESET}"
    "$installer_func"
  else
    echo "${GREEN}${cmd} は既にインストールされています。${RESET}"
  fi
}

# caskのinstall
install_cask() {
  local package="$1"
  local installer_func="$2"

  if brew list --cask "$package" &> /dev/null; then
    echo "${GREEN}${package} はすでにインストールされています${RESET}"
  else
    echo "${YELLOW}${package} が見つかりません。インストールを試みます。${RESET}"
    "$installer_func"
  fi
}

# インストール処理
install_brew() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_wget() {
  brew install wget
}

install_tig() {
  brew install tig
}

install_nvim() {
  brew install nvim
}

install_python() {
  brew install pyenv
  brew install xz
  pyenv install 3.13.3
  pyenv global 3.13.3
}

install_ripgrep() {
  brew install ripgrep
}

install_tmux() {
  brew install tmux
}

install_tmuxinator() {
  brew install tmuxinator
}

install_sauce_code_pro() {
  brew install --cask font-sauce-code-pro-nerd-font
}


install brew install_brew
install wget install_wget
install tig install_tig
install nvim install_nvim
install python install_python
install rg install_ripgrep
install tmux install_tmux
install tmuxinator install_tmuxinator
install_cask font-sauce-code-pro-nerd-font install_sauce_code_pro

mkdir -p "$HOME/.config"

link "$HOME/src/github.com/hananana/dotfiles/src/zshrc" "$HOME/.zshrc"
link "$HOME/src/github.com/hananana/dotfiles/src/gitconfig" "$HOME/.gitconfig"
link "$HOME/src/github.com/hananana/dotfiles/src/commit_template.txt" "$HOME/.commit_template.txt"
link "$HOME/src/github.com/hananana/dotfiles/src/nvim" "$HOME/.config/nvim"
link "$HOME/src/github.com/hananana/dotfiles/src/tigrc" "$HOME/.tigrc"
link "$HOME/src/github.com/hananana/dotfiles/src/tmux.conf" "$HOME/.tmux.conf"
link "$HOME/src/github.com/hananana/dotfiles/src/tmuxinator" "$HOME/.tmuxinator"
link "$HOME/src/github.com/hananana/dotfiles/src/gitignore_global" "$HOME/.gitignore_global"

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

exec zsh

echo "${GREEN}iTerm2>Settings>General>Settings>ExternalSettingsに$HOME/src/github.com/hananana/dotfiles/srcを指定してください${RESET}"
