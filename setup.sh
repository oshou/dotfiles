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
if [[ ! -e ~/.pyenv ]]; then
  echo "* install pyenv"
  git clone https://github.com/yyuu/pyenv.git ~/.pyenv
fi
# for Go
if [[ ! -e ~/.goenv ]]; then
  echo "* install goenv"
  git clone https://github.com/syndbg/goenv.git ~/.goenv
fi
# for PHP
if [[ ! -e ~/.phpenv ]]; then
  echo "* install phpenv"
  git clone https://github.com/madumlao/phpenv.git ~/.phpenv
fi
# for Ruby
if [[ ! -e ~/.rbenv ]]; then
  echo "* install rbenv"
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
fi

# Download Vim Plugin
echo "* auto setup is complete !!"
echo "***** Please exec 'vim' && exec ':BundleInstall'' *****"
