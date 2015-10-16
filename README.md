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

- geeknote

```sh
$cd
$mkdir utils
$cd utils
$git clone git://github.com/VitaliyRodnenko/geeknote.git
$cd geeknote
$sudo python setup.py install
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

## MEMO

- cocosを書く時は.ycm以下略のシンボリックリンクをcocosプロジェクトのトップに作ること

