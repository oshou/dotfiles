#!/bin/bash

# Install tmux
sudo yum -y install tmux

DOT_FILES=(.bash_logout .bash_profile .bashrc .gitignore .tmux.conf .vimrc)

# Download Vundle.vim
for file in ${DOT_FILES[@]}
do
  if [ -e $HOME/$file ];
  then
    cp $HOME/$file $HOME/$file.bak_`date +%y%m%d`
  fi
  ln -sf $HOME/dotfiles/$file $HOME/$file
  echo "make link $HOME/dotfiles/$file -> $HOME/$file"
done
source $HOME/.bashrc

# Download Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Download Message Bundles
echo "Please open Vim && do BundleInstall"
echo "setup is complete!"
