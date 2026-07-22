# herdr

[herdr](https://herdr.dev) の設定。`config.toml` のみを管理する（ソケット/ログ/session 等のランタイム状態は `~/.config/herdr/` 側に残す）。

## セットアップ

`~/.config/herdr/config.toml` を、このリポジトリの `config.toml` へのシンボリックリンクにする。

```sh
mkdir -p ~/.config/herdr
# 既存の実ファイルがあれば退避してから
ln -sf ~/dotfiles/herdr/config.toml ~/.config/herdr/config.toml
```

反映:

```sh
herdr server reload-config
```

## メモ

- キーバインドは tmux (`~/.tmux.conf`, prefix `ctrl+j`) 準拠。
- `close_pane` / `close_tab` は confirm-close プラグインに委譲している。
  プラグイン本体: https://github.com/petitviolet/herdr-plugins
