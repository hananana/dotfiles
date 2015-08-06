
## 手順

- vimとsilver_sercherいれようず

```
$brew install vim --with-client-server --with-lua
$brew install the_silver_searcher
```
    - 必要に応じてwhich vimして現在のvimをどっかに追いやってbrewで入れたvimからシンボリックリンク作成

- このリポジトリをclone
- .zshrc .vim .vimrc .gvimrc schemaをln -sでHOME直下からシンボリックリンク
- NeoBundleをゲット

```
$curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
```

- いったんvimを起動してBundle達をいれる
- Omnisharpを設定する

```
$cd .vim/bundle/omnisharp-vim/
$g submodule update --init
$cd server
$xbuild
```

- vimprocをいれましょう

```
$ cd .vim/bundle/vimproc
$ make
```

## MEMO

- C#を読む時はprojectのslnを設定するんだぜ！
