#!/bin/bash

readonly DOT_FILES=(.bash_profile .bashrc .vimrc .gvimrc .tmux.conf)
readonly DOT_FILES_DIR=$(cd $(dirname $0);pwd)

# Setup dotfiles
mkdir -p ${DOT_FILES_DIR}/bk
for file in ${DOT_FILES[@]}
do
  if [ -e $HOME/$file ];then
    echo "Backup $HOME/$file -> ${DOT_FILES_DIR}/bk/$file.bak_`date +%y%m%d`"
    cp $HOME/$file ${DOT_FILES_DIR}/bk/$file.bak_`date +%y%m%d`
  fi
  echo "Create Link ${DOT_FILES_DIR}/$file -> $HOME/$file"
  ln -sf ${DOT_FILES_DIR}/$file $HOME/$file
done
source $HOME/.bashrc

# Download Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

if [ ! -e $HOME/bin ]; then
  mkdir $HOME/bin
fi
cd $HOME/bin

# Download Composer
if [ ! -e 'composer' ]; then
  curl -sS https://getcomposer.org/installer | php
  mv composer.phar composer
  chmod +x composer
fi

# Download PHPUnit
cd $HOME/bin
if [ ! -e 'phpunit' ]; then
  wget https://phar.phpunit.de/phpunit-6.5.phar
  mv phpunit-6.5.phar phpunit
  chmod +x phpunit
fi

# Download Psysh
cd $HOME/bin
if [ ! -e 'psysh' ]; then
  wget https://psysh.org/psysh
  chmod +x psysh
fi

# Download PHP-cs-fixer
cd $HOME/bin
if [ ! -e 'php-cs-fixer' ];then
  wget https://cs.sensiolabs.org/download/php-cs-fixer-v2.phar -O php-cs-fixer
  chmod a+x php-cs-fixer
fi

# Download Vim Plugin
echo "setup is complete!"
echo "***** Please exec 'vim' && exec ':BundleInstall'' *****"
