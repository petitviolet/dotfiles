#!/bin/bash
curl -O https://github.com/peco/peco/releases/download/v0.2.0/peco_linux_amd64.tar.gz
tar zxvf peco_linux_amd64.tar.gz
sudo cp peco_linux_amd64/peco /usr/local/bin
exec $SHELL -l
