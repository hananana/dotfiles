
## 手順

- vimをいれようず

```
$brew install vim --with-client-server --with-lua
```
- 必要に応じてwhich vimして現在のvimをどっかに追いやってbrewで入れたvimからシンボリックリンク作成

- clone
- .zshrc .vim .vimrc .gvimrc schemaをln -sでHOME直下からシンボリックリンク
- NeoBundleをゲット

```
$curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
```

- Omnisharpを設定する

```
$cd .vim/bundle/omnisharp-vim/
$g submodule update --init
$cd server
$xbuild
```

## MEMO

- C#を読む時はprojectのslnを設定するんだぜ！
