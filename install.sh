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
