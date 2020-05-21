#!/bin/bash -e

mkdir -p $HOME/.config
ln -s $(dirname $PWD)/$(basename $PWD)/nvim $HOME/.config/nvim

pyenv install 2.7.18
pyenv virtualenv 2.7.18 neovim-py2
pyenv shell 2.7.18
pip install pynvim

pyenv install 3.7.4
pyenv virtualenv 3.7.4 neovim-py3
pyenv shell 3.7.4
pip install pynvim

brew install nvim
