#!/bin/bash

readonly DOTFILES_DIR=$(cd $(dirname $0);pwd)
readonly DOTFILES=(
  .zprofile
  .vimrc
  .gvimrc
  .tigrc
  .tmux.conf
  .gitconfig
  brewfile
)

# Setup dotfiles
mkdir -p ${DOTFILES_DIR}/backup
for file in ${DOTFILES[@]}
do
  if [[ -e ~/$file ]];then
    echo "* backup $HOME/$file -> ${DOTFILES_DIR}/backup/$file.bak_`date +%y%m%d-%H%m%S`"
    cp ~/$file ${DOTFILES_DIR}/backup/$file.bak_`date +%y%m%d-%H%m%S`
  fi
  echo "* create Link ${DOTFILES_DIR}/$file -> ~/$file"
  ln -sf ${DOTFILES_DIR}/$file ~/$file
done
source ~/.bashrc

# Install common tools
anyenv install --init
if [ "$(uname)" == 'Darwin' ]; then
  brew bundle
  brew cleanup
elif [ "$(uname)" == 'Linux' ]; then
  if [[ ! -e ~/.anyenv ]]; then
    git clone https://github.com/anyenv/anyenv ~/.anyenv
  fi
fi

# Install Vundle.vim
if [[ ! -e ~/.vim/bundle/Vundle.vim ]]; then
  echo "* install Vundle.vim"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Install xxxenv
# for Python
if [ ! `which pyenv` ]; then
  echo "* install pyenv"
  anyenv install pyenv
fi
# for Node
if [ ! `which nodenv` ]; then
  echo "* install nodenv"
  anyenv install nodenv
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

# Apply
exec $SHELL -l

# VSCode
code --install-extension coenraads.bracket-pair-colorizer
code --install-extension ms-vscode.go
code --install-extension ionutvmi.path-autocomplete

# Mac
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults delete -g ApplePressAndHoldEnabled

# Install Vim Plugin
echo "* auto setup is complete !!"
echo "***** Please exec 'vim' && exec ':BundleInstall'' *****"
