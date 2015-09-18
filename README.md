## 概要
vim初心者が最終的に全部をvimで開発するためのvim設定のrepository。
C#、ruby,markdownに対応済み。
参考のakinama氏の[dotfiles](https://github.com/akinama/dotfiles)

## 手順

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

- 神の補完YouCompleteMe

でも手順が超複雑なので頑張ろう  
https://github.com/Valloric/YouCompleteMe

- vimprocをいれましょう

```sh
$ cd .vim/bundle/vimproc
$ make
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

- git

```sh
$git config --global --add core.excludesfile "$HOME/.gitignore_global"
```

## MEMO

- cocosを書く時は.ycm以下略のシンボリックリンクをcocosプロジェクトのトップに作ること

