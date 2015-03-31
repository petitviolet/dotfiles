#!/bin/sh

# vimをinstallする
# オプションは適宜変更

cd $HOME
mkdir tmp
cd tmp
hg clone https://vim.googlecode.com/hg/ vim
# 更新する場合は
hg pull
hg update

# wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
# tar -xjf vim-7.4.tar.bz2
# cd vim74
# mkdir patches
# cd patchs
# seq -f http://ftp.vim.org/pub/vim/patches/7.4/7.4.%03g 355 | xargs wget
# cd ..
# cat patches/7.4.* | patch -p0
# ./configure --with-features=huge --enable-multibyte --enable-rubyinterp --enable-pythoninterp --enable-luainterp

./configure --with-features=huge --enable-multibyte --enable-pythoninterp=dynamic --enable-tclinterp --enable-cscope --enable-fontset --enable-gnome-check --disable-gui --without-x --enable-gpm --with-python --with-python3 --with-lua --with-ruby --with-python-config-dir=/usr/local/bin/python

make && make install
