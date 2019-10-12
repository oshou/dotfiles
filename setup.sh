#!/bin/bash

readonly DOT_FILES=(.bash_profile .bashrc .vimrc .gvimrc .tmux.conf)
readonly DOT_FILES_DIR=$(cd $(dirname $0);pwd)

# Setup dotfiles
mkdir -p ${DOT_FILES_DIR}/bk
for file in ${DOT_FILES[@]}
do
  if [[ -e ~/$file ]];then
    echo "* backup $HOME/$file -> ${DOT_FILES_DIR}/bk/$file.bak_`date +%y%m%d`"
    cp ~/$file ${DOT_FILES_DIR}/bk/$file.bak_`date +%y%m%d`
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

if [[ ! -e ~/bin ]]; then
  echo "* make ~/bin directory"
  mkdir ~/bin
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

# Download Composer
cd $HOME/bin
if [[ ! -e composer ]]; then
  echo "* install composer"
  curl -sS https://getcomposer.org/installer | php
  mv composer.phar composer
  chmod +x composer
fi

# Download PHPUnit
cd $HOME/bin
if [[ ! -e phpunit ]]; then
  echo "* install phpunit"
  wget https://phar.phpunit.de/phpunit-6.5.phar
  mv phpunit-6.5.phar phpunit
  chmod +x phpunit
fi

# Download Psysh
cd $HOME/bin
if [[ ! -e psysh ]]; then
  echo "* install psysh"
  wget https://psysh.org/psysh
  chmod +x psysh
fi

# Download PHP-cs-fixer
cd $HOME/bin
if [[ ! -e php-cs-fixer ]];then
  echo "* install php-cs-fixer"
  wget https://cs.sensiolabs.org/download/php-cs-fixer-v2.phar -O php-cs-fixer
  chmod a+x php-cs-fixer
fi

# Download Vim Plugin
echo "setup is complete!"
echo "***** Please exec 'vim' && exec ':BundleInstall'' *****"
