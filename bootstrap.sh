#!/usr/bin/env bash

CURRENT_DIR=`dirname $0`
if [ $CURRENT_DIR = '.' ];then
    CURRENT_DIR=`pwd`
fi
echo $CURRENT_DIR

ln -sif $CURRENT_DIR/.gitconfig $HOME/
ln -sif $CURRENT_DIR/.jshintrc $HOME/
ln -sif $CURRENT_DIR/.pylintrc $HOME/
ln -sif $CURRENT_DIR/.tmux.conf $HOME/
ln -sif $CURRENT_DIR/.vimrc $HOME/

# install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# make dir for undo history
mkdir -p ~/.vim/undodir
