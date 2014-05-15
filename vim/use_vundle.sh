#!/bin/bash - 
#===============================================================================
#
#          FILE: use_pathogen.sh
# 
#         USAGE: ./use_pathogen.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2013/09/07 12时41分26秒 CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
PWD=`pwd`

if [ -L $HOME/.vim ];then
    rm $HOME/.vim
fi

if [ -L $HOME/.vimrc ];then
    rm $HOME/.vimrc
fi

if [ -L $HOME/.vimrc_common ];then
    rm $HOME/.vimrc_common
fi

if [ -L $HOME/.vim_common ];then
    rm $HOME/.vim_common
fi

#if [ -L ./vim_vundle/colors ];then
#    rm ./vim_vundle/colors
#fi
#if [ -L ./vim_vundle/after ];then
#    rm ./vim_vundle/after
#fi
#if [ -L ./vim_vundle/syntax ];then
#    rm ./vim_vundle/syntax
#fi

#ln -s -F $PWD/vim_common/colors $PWD/vim_vundle/colors
#ln -s -F $PWD/vim_common/after  $PWD/vim_vundle/after
#ln -s -F $PWD/vim_common/syntax $PWD/vim_vundle/syntax

ln -s -f $PWD/vimrc_vundle $HOME/.vimrc
ln -s -f $PWD/vimrc_common $HOME/.vimrc_common
ln -s -F $PWD/vim_vundle $HOME/.vim
ln -s -F $PWD/vim_common $HOME/.vim_common

