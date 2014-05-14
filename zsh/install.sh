#!/usr/bin/env bash


MYPATH=`pwd`

# install zsh 
cd $HOME
if [ -h .zshrc ] || [ -f .zshrc ]; then
    rm .zshrc
fi
ln -s $MYPATH/zshrc .zshrc

if [ -h .myzsh ]; then
    rm .myzsh
fi
ln -s $MYPATH/myzsh .myzsh


