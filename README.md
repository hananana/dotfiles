## これはなに
vim初心者が最終的に全部をvimで開発するためのrepository  
C++,C#,ruby,markdown,json,swift,go,pythonに対応済み   

参考のakinama氏の[dotfiles](https://github.com/akinama/dotfiles)  

## 手順

setting.shで自動化したいけどまだできてないっ

- vimをいれる

```sh
$ mkdir .dotfiles
$ git clone git@github.com:hanana0501/dotfiles.git ~/.dotfiles
$ .dotfiles/setting.sh
$ brew install vim --with-client-server --with-lua
$ brew install the_silver_searcher
$ curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
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

- font

http://mix-mplus-ipa.osdn.jp/migu/
Migu 1Mのフォントを落とそう

設定はRegularはMigu1Mで14pt

- fuck
```
$ sudo pip install thefuck
```

## MEMO

- cocosを書く時は.ycm以下略のシンボリックリンクをcocosプロジェクトのトップに作ること
