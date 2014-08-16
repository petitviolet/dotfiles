#!/bin/sh
# とりあえずの開発環境をパーッと整える
# 不必要になるものも多い

sudo yum -y update
sudo yum -y groupinstall 'Development tools'
sudo yum -y groupinstall 'MySQL Database client'
sudo yum -y groupinstall 'MySQL Database'
sudo yum -y groupinstall 'Development Libraries'
sudo yum -y install zsh zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel sysstat tmux libevent
