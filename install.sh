#!/bin/sh
cd $(dirname $0)
for dotfile in _*
do
  if [ $dotfile != 'install.sh' ] && [ $dotfile != '_git' ]
  then
    fn=$(echo $dotfile | sed -e s/_/\./)
    if [ $HOME/$fn ]
    then
      echo filename is $HOME/$fn
      rm -i $HOME/$fn
    fi
    ln -s $HOME/dotfiles/$dotfile $HOME/$fn
  fi
done

sudo yum groupinstall 'Development tools'
sudo yum install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-deve
git clone https://github.com/riywo/anyenv ~/.anyenv
rehash
anyenv install pyenv
rehash
pyenv install 3.4.0
pyenv install 2.7.6
