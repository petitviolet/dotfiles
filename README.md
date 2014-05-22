# dotfilesを設定

主にzshrc(.alias)とvimrcが大事
zshrc.localやvimrc.localにgithubに上げない情報を入れておく

## 設定ファイルの配置

```sh
git clone https://github.com/petitviolet/dotfiles.git
cd dotfiles
sh install.sh
# 既に設定ファイルがあれば上書きするかどうかを聞かれる(rm -iする)
# 設定ファイルがないと警告メッセージが表示されるが無視して良い
```

これで、$HOMEディレクトリに.vimrc, .zshrc, .zshrc.alias, .tmux.confが作成される。  
それぞれdotfiles/の\_vimrc, \_zshrc, \_zshrc.alias, \_tmux.confのシンボリックリンクとなっている。


## vim

プラグインを入れる
`NeoBundle`を入れるために`Vundle`を使う
`:BundleInstall`と`:NeoBundleInstall`を実行する
`:messages`でエラーメッセージを見て適宜対応

## tmux.conf

最下行に`reattach-to-user-namespace`とあるが、この行をコメントアウトする必要がある
Macであればそのままで良い

## Mac

```sh
# homebrewのインストール
ruby  - e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
# Brewfileに従ってソフトウェアをインストール
brew bundle
# Rictyフォントをインストール、配置
sh ricty.sh
``` 

## CentOS

```sh
# yumで色々インストール
sh yum.sh
# vim74をインストール
# パッチ番号は確認する
# http://ftp.vim.org/pub/vim/patches/7.4/
sh vim.sh
```
