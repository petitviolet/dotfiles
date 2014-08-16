#!/bin/sh
# スクリプト言語用のenvを作るためのanyenv
# ここではpyenvのみ

git clone https://github.com/riywo/anyenv ~/.anyenv
exec $SHELL -l
anyenv install pyenv
exec $SHELL -l
pyenv install 3.4.1
exec $SHELL -l
pyenv install 2.7.7
exec $SHELL -l
pyenv global 3.4.1
exec $SHELL -l
