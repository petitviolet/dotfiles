#!/bin/sh

cd $HOME
mkdir tmp
cd tmp
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
tar -xjf vim-7.4.tar.bz2
cd vim74
mkdir patches
cd patchs
seq -f http://ftp.vim.org/pub/vim/patches/7.4/7.4.%03g 295 | xargs wget
cd ..
cat patches/7.4.* | patch -p0
./configure --with-features=huge --enable-multibyte --enable-rubyinterp --enable-pythoninterp --enable-luainterp
make && make install
