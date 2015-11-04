## 概要
vim初心者が最終的に全部をvimで開発するためのvim設定のrepository。
C#、ruby,markdownに対応済み。
参考のakinama氏の[dotfiles](https://github.com/akinama/dotfiles)

## 手順

- vimをいれる

```sh
$ cd
$ mkdir .dotfiles
$ cd .dotfiles
$ git clone git@github.com:hanana0501/dotfiles.git
$ sh setting.sh
$ brew install vim --with-client-server --with-lua
$ brew install the_silver_searcher
$ curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
```

- antigenからzshのpluginを導入

```sh
$ cd
$ git clone https://github.com/zsh-users/antigen
$ source ~/.zshrc
```

- karabiner

```sh
$ brew install caskroom/cask/brew-cask
$ brew cask install karabiner
$ cd ~/Library/Application\ Support/Karabiner
$ rm private.xml
$ ln -s ~/.dotfiles/dotfiles/private.xml private.xml
```

karabinerを起動してLeave Insert Mode（以下略をONに

- tmux

```sh
$ brew install tmux
$ git clone https://github.com/erikw/tmux-powerline.git
$ gem install tmuxinator
```

- powerline

git@github.com:powerline/fonts.gitからHackのフォントを落としてインストールすること
iTermでの設定はRegularは12pt、NON-ASCIIは14pt

```sh
$ easy_install pip
$ pip install git+git://github.com/Lokaltog/powerline
$ mv ~/Library/Python/2.7/lib/python/site-packages/powerline/config_files ~/Library/Python/2.7/lib/python/site-packages/powerline/backup_config_files
$ ln -s ~/.dotfiles/config_files ~/Library/Python/2.7/lib/python/site-packages/powerline/config_files
```

- iTerm2のFont設定

https://github.com/powerline/fontsをcloneして…HackのFontをインストール
http://mix-mplus-ipa.osdn.jp/migu/からmigu1Mをインストール

Regular migu-1M Regular 16pt  
NON-ASCII Hack 18pt

## MEMO

- cocosを書く時は.ycm以下略のシンボリックリンクをcocosプロジェクトのトップに作ること

