# ghostty

[Ghostty](https://ghostty.org) の設定。外側ターミナルとして使い、pane/tab は herdr 側で管理する。

## セットアップ

`~/.config/ghostty/config` をこのリポジトリの `config` へのシンボリックリンクにする。

```sh
mkdir -p ~/.config/ghostty
ln -sf ~/dotfiles/ghostty/config ~/.config/ghostty/config
```

反映: Ghostty で `Cmd+Shift+,`(reload config) または再起動。

## メモ

- pane/tab は herdr が管理するため Ghostty はシンプルな単一ウィンドウ構成。
- `Ctrl+V` は Ghostty で未バインド(素通し)。これにより herdr 内 Claude Code の
  クリップボード画像貼り付け(Ctrl+V)が効く。iTerm2 では Kitty graphics 非対応で
  効かなかったため Ghostty に移行した経緯。
- フォントは Ricty(`~/Library/Fonts`)。設定値は `ghostty +show-config` で確認可能。
