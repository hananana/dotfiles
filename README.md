
## 手順

- vimをいれようず

```
brew install vim --with-client-server --with-lua
```

- clone
- .zshrc .vim .vimrc .gvimrc schemaをln -sでHOME直下からシンボリックリンク
- NeoBundleをゲット

```
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
```

- iTerm2,MacVimを落とす
- iTerm2のProfileからsolarizedを設定
- iTerm2からvimを起動し、:NeoBundleInstall
