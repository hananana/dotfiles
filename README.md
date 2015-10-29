## 概要
vim初心者が最終的に全部をvimで開発するためのvim設定のrepository。
C#、ruby,markdownに対応済み。
参考のakinama氏の[dotfiles](https://github.com/akinama/dotfiles)

## 手順

- vimをいれる

```sh
$cd
$mkdir .dotfiles
$cd .dotfiles
$git clone git@github.com:hanana0501/dotfiles.git
$sh setting.sh
$brew install vim --with-client-server --with-lua
$brew install the_silver_searcher
$curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
```

- antigenからzshのpluginを導入

```sh
$cd
$git clone https://github.com/zsh-users/antigen
$source ~/.zshrc
```

- フォント  
http://mix-mplus-ipa.osdn.jp/migu/  
上記のMigu1Mを16ptがみやすいです

- karabiner

```sh
$brew install caskroom/cask/brew-cask
$brew cask install karabiner
$cd ~/Library/Application\ Support/Karabiner
$rm private.xml
$ln -s ~/.dotfiles/dotfiles/private.xml private.xml
```

karabinerを起動してLeave Insert Mode（以下略をONに

- tmux

```sh
$brew install tmux
$git clone https://github.com/erikw/tmux-powerline.git
$gem install tmuxinator
```

## MEMO

- cocosを書く時は.ycm以下略のシンボリックリンクをcocosプロジェクトのトップに作ること

