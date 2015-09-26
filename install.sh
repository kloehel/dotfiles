#!/bin/bash

# If something goes wrong, get the f*ck out.
set -e

# Initialize and update git submodules.
git submodule init
git submodule update

# Install the files on this repo.
cp bashrc $HOME/.bashrc
cp bash_profile $HOME/.bash_profile
cp tmux.conf $HOME/.tmux.conf

# Wipe out the current vim config and replace it with this one.
rm -rf $HOME/.vim
rm -rf $HOME/.vimrc
cp -rf vim $HOME/.vim
cp vimrc $HOME/.vimrc
vim +PluginInstall +qall
