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
$ gem install tmuxinator
```

- font

inconsolata 12pt

- scheme

Japonesqueで！

# tools
## いつか自動化したいンゴ

unity
xcode
f.lux
caffeine
alfred
dropbox
androidstudio
dash
sourcetree
shiftit
wallcat

eclim
brew cask install eclipse-java
http://eclim.org/install.html
java -jar /path/to/eclimhoge.jar

# brew 
tree
tig
plantuml
graphviz
peco
rbenv
ther_silver_searcher
tmux
mplayer
pushbullet

# brew cask
karabiner
eclipse-java
appcleaner
texturepacker
