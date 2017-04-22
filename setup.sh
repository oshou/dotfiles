#!/bin/bash

DOT_FILES=(.bash_logout .bash_profile .bashrc .tmux.conf .vimrc)

# Set dotfiles symbolic link
mkdir -p $HOME/dotfiles/bk
for file in ${DOT_FILES[@]}
do
  if [ -e $HOME/$file ];
  then
    echo "move old dotfiles -> $HOME/bk/$file.bak_`date +%y%m%d`"
    cp $HOME/$file $HOME/dotfiles/bk/$file.bak_`date +%y%m%d`
  fi
  ln -sf $HOME/dotfiles/$file $HOME/$file
  echo "make link $HOME/dotfiles/$file -> $HOME/$file"
done
source $HOME/.bashrc

# Download Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install tmux
#sudo yum -y install tmux

# Download Vundle Plugin
echo "setup is complete!"
echo "***** Please open Vim && do BundleInstall *****"
