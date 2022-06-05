#!/bin/bash -e

mkdir -p $HOME/.config || true
ln -s $(dirname $PWD)/$(basename $PWD)/nvim $HOME/.config/nvim || true

pyenv install 2.7.18 || true
pyenv virtualenv 2.7.18 neovim-py2 || true
pyenv shell 2.7.18 || true
pip install pynvim || true

pyenv install 3.10.2 || true
pyenv virtualenv 3.10.2 neovim-py3 || true
pyenv shell 3.10.2 || true
pip install pynvim || true

brew install nvim || true
