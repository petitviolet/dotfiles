#!/bin/bash
# curl -O https://github.com/peco/peco/releases/download/v0.2.9/peco_linux_amd64.tar.gz
wget https://github.com/peco/peco/releases/download/v0.2.9/peco_linux_amd64.tar.gz
tar zxvf peco_linux_amd64.tar.gz
sudo cp peco_linux_amd64/peco /usr/local/bin
rm peco_linux_amd64.tar.gz
exec $SHELL -l
