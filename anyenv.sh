#!/bin/sh
# スクリプト言語用のenvを作るためのanyenv
# ここではpyenvのみ

git clone https://github.com/riywo/anyenv ~/.anyenv
exec $SHELL -l
anyenv install pyenv
exec $SHELL -l
pyenv install 3.4.2
exec $SHELL -l
pyenv install 2.7.8
exec $SHELL -l
pyenv global 3.4.2
exec $SHELL -l
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
