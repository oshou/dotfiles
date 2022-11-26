#!/bin/bash

readonly DOTFILES_DIR=$(cd $(dirname $0);pwd)
readonly DOTFILES=(
  Brewfile
  .vimrc
  .gitconfig
  .gvimrc
  .tmux.conf
  .tigrc
  .zprofile
)

echo "* backup & setup dotfiles ..."
mkdir -p ${DOTFILES_DIR}/backup
for file in ${DOTFILES[@]}
do
  if [[ -e ~/$file ]];then
    echo "* backup $HOME/$file -> ${DOTFILES_DIR}/backup/$file.bak_`date +%Y%m%d-%H%m%S`"
    cp ~/$file ${DOTFILES_DIR}/backup/$file.bak_`date +%Y%m%d-%H%m%S`
  fi
  echo "* create Link ${DOTFILES_DIR}/$file -> ~/$file"
  ln -sf ${DOTFILES_DIR}/$file ~/$file
done
source ~/.bashrc

echo "* setup anyenv ..."
anyenv install --init
if [[ ! -e ~/.anyenv ]]; then
  git clone https://github.com/anyenv/anyenv ~/.anyenv
fi

echo "* brew bundle ..."
brew bundle

echo "* brew cleanup ..."
brew cleanup

if [[ ! -e ~/.vim/bundle/Vundle.vim ]]; then
  echo "* install Vundle.vim ..."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ ! `which pyenv` ]; then
  echo "* install pyenv ..."
  anyenv install pyenv
fi

if [ ! `which nodenv` ]; then
  echo "* install nodenv ..."
  anyenv install nodenv
fi

if [ ! `which goenv` ]; then
  echo "* install goenv ..."
  anyenv install goenv
fi

if [ ! `which phpenv` ]; then
  echo "* install phpenv ..."
  anyenv install phpenv
fi

exec $SHELL -l

# VSCode
code --install-extension coenraads.bracket-pair-colorizer
code --install-extension ms-vscode.go
code --install-extension ionutvmi.path-autocomplete

# Mac
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults delete -g ApplePressAndHoldEnabled

# Install Vim Plugin
echo "* setup is completed !!"
echo "***** Please exec 'vim' && exec ':BundleInstall'' *****"
