#!/bin/bash

readonly DOT_FILES=(.bash_profile .bashrc .vimrc .gvimrc .tmux.conf)
readonly DOT_FILES_DIR=$(cd $(dirname $0);pwd)

# Setup dotfiles
mkdir -p ${DOT_FILES_DIR}/bk
for file in ${DOT_FILES[@]}
do
  if [[ -e ~/$file ]];then
    echo "* backup $HOME/$file -> ${DOT_FILES_DIR}/bk/$file.bak_`date +%y%m%d-%H%m%S`"
    cp ~/$file ${DOT_FILES_DIR}/bk/$file.bak_`date +%y%m%d-%H%m%S`
  fi
  echo "* create Link ${DOT_FILES_DIR}/$file -> ~/$file"
  ln -sf ${DOT_FILES_DIR}/$file ~/$file
done
source ~/.bashrc

# Download Vundle.vim
if [[ ! -e ~/.vim/bundle/Vundle.vim ]]; then
  echo "* install Vundle.vim"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi


# Download xxxenv
# for Python
if [ ! `which pyenv` ]; then
  echo "* install pyenv"
  anyenv install pyenv
fi
# for Go
if [ ! `which goenv` ]; then
  echo "* install goenv"
  anyenv install goenv
fi
# for PHP
if [ ! `which phpenv` ]; then
  echo "* install phpenv"
  anyenv install phpenv
fi
# for Ruby
if [ ! `which rbenv` ]; then
  echo "* install rbenv"
  anyenv install phpenv
fi

# Download Vim Plugin
echo "* auto setup is complete !!"
echo "***** Please exec 'vim' && exec ':BundleInstall'' *****"
