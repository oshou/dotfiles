#!/bin/bash

readonly DOT_FILES=(.bash_logout .bash_profile .bashrc .tmux.conf .vimrc)
readonly DOT_FILES_DIR=$(cd $(dirname $0);pwd)

# Set dotfiles setup
mkdir -p ${DOT_FILES_DIR}/bk
for file in ${DOT_FILES[@]}
do
  if [ -e $HOME/$file ];
  then
    echo "Backup $HOME/$file -> ${DOT_FILES_DIR}/bk/$file.bak_`date +%y%m%d`"
    cp $HOME/$file ${DOT_FILES_DIR}/bk/$file.bak_`date +%y%m%d`
  fi
  echo "Create Link ${DOT_FILES_DIR}/$file -> $HOME/$file"
  ln -sf ${DOT_FILES_DIR}/$file $HOME/$file
done
source $HOME/.bashrc

# Download Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Download Vundle Plugin
echo "setup is complete!"
echo "***** Please exec 'vim' && exec ':BundleInstall'' *****"