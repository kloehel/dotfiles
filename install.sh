#!/bin/bash

PROJECTS="$HOME/Projects"

# If something goes wrong, get the f*ck out.
set -e

# Initialize and update git submodules.
git submodule init
git submodule update

# Install the files on this repo.
cp bashrc $HOME/.bashrc
cp bash_profile $HOME/.bash_profile
cp gemrc $HOME/.gemrc
cp gitcompletion.sh $HOME/.gitcompletion.sh
cp gitconfig $HOME/.gitconfig
cp global.gitignore $HOME/.gitignore
cp tmux.conf $HOME/.tmux.conf
cp rake_completion $HOME/.rake_completion
cp rvmrc $HOME/.rvmrc
chmod +x $HOME/.rake_completion

# Wipe out the current vim config and replace it with this one.
rm -rf $HOME/.vim
rm -rf $HOME/.vimrc
cp -rf vim $HOME/.vim
mkdir -p $HOME/.vim/backups
cp vimrc $HOME/.vimrc
vim +PluginInstall +qall

# Install the completion file for the `docker` command.
wget https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker -O $HOME/.dockercompletion.sh

# PEDA
if [ ! -d "$HOME/.peda" ]; then
    git clone https://github.com/longld/peda.git ~/.peda
    echo "source ~/peda/peda.py" >> ~/.gdbinit
    echo "DONE! debug your program with gdb and enjoy"
fi
