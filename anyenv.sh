#!/bin/sh

git clone https://github.com/riywo/anyenv ~/.anyenv
rehash
anyenv install pyenv
rehash
pyenv install 3.4.1
pyenv install 2.7.6
pyenv shell 3.4.1
