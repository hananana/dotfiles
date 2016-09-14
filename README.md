## これはなに
vim初心者が最終的に全部をvimで開発するためのrepository  
C++,C#,ruby,markdown,json,swift,go,pythonに対応済み   

参考のakinama氏の[dotfiles](https://github.com/akinama/dotfiles)  

## 注意
monoのverは4.0.1じゃないとyoucompletemeが動かない

## 手順

```sh
$ git clone git@github.com:hanana0501/dotfiles.git ~/.dotfiles
$ .dotfiles/scripts/setting.sh
```

### karabiner

```sh
$ brew install caskroom/cask/brew-cask
$ brew cask install karabiner
$ cd ~/Library/Application\ Support/Karabiner
$ rm private.xml
$ ln -s ~/.dotfiles/dotfiles/private.xml private.xml
```

karabinerを起動してLeave Insert Mode（以下略をONに

### tmux
```sh
$ gem install tmuxinator
```

### terminal setting

- inconsolata 12pt
- Japonesque

## tools(いつか自動化したいンゴ)

unity
xcode
f.lux
dropbox
androidstudio
sourcetree
wallcat
pushbullet

eclim
brew cask install eclipse-java
http://eclim.org/install.html
java -jar /path/to/eclimhoge.jar
