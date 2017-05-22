#!/bin/sh
cd $(dirname $0)
for dotfile in _*
do
  if [ $dotfile != 'install.sh' ] && [ $dotfile != '_git' ]
  then
    fn=$(echo $dotfile | sed -e s/_/\./)
    if [ $HOME/$fn ]
    then
      echo symlinked $HOME/$fn
      # rm -i $HOME/$fn
      mv $HOME/$fn $HOME/.Trash/
    fi
    ln -s $HOME/dotfiles/$dotfile $HOME/$fn
  fi
done
