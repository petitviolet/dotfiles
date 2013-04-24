#!/bin/sh
cd $(dirname $0)
for dotfile in _*
do
  if [ $dotfile != '_install.sh' ] && [ $dotfile != '_git' ]
  then
    fn=$(echo $dotfile | sed -e s/_/\./)
    ln -s $HOME/dotfiles/$dotfile $HOME/$fn
  fi
done
