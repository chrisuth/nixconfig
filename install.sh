#!/usr/bin/env bash


MYPATH=`pwd`

# install zsh 
cd $HOME
if [ -h .zshrc ] || [ -f .zshrc ]; then
    rm .zshrc
fi
ln -s $MYPATH/zsh/zshrc .zshrc

if [ -h .myzsh ]; then
    rm .myzsh
fi
ln -s $MYPATH/zsh/myzsh .myzsh

# install bash
cd $HOME
if [ -h .bashrc ] || [ -f .bashrc ];then
    rm .bashrc
fi
ln -s $MYPATH/bash/bashrc .bashrc

# install screenrc
cd $HOME
if [ -h .screenrc ] || [ -f .screenrc ];then
    rm .screenrc
fi
ln -s $MYPATH/screen/screenrc .screenrc

if [ -f .screenrcgb ] || [ -h .screenrcgb ];then
    rm .screenrcgb
fi
ln -s $MYPATH/screen/screenrcgb .screenrcgb


# shell common
cd $HOME
if [ -h .shellcommon.sh ]; then
    rm .shellcommon.sh
fi
ln -s $MYPATH/shell/shellcommon.sh .shellcommon.sh

# ctags
cd $HOME
if [ -h .ctags ] || [ -f .ctags ]; then
    rm .ctags
fi
ln -s $MYPATH/ctags/ctags .ctags

# tmux
cd $HOME
if [ -h .tmux.conf ] || [ -f .tmux.conf ]; then
    rm .tmux.conf
fi
ln -s $MYPATH/tmux/tmux.conf .tmux.conf


