#!/bin/bash

DOT_FILES=(.bash_logout .bash_profile .bashrc .cshrc .gitconfig .gitignore .tcshrc .tmux.conf .vimrc .pryrc)

for file in ${DOT_FILES[@]}
do
    ln -sf $HOME/dotfiles/$file $HOME/$file
    echo "make link $HOME/dotfiles/$file -> $HOME/$file"
done
source .bashrc

# Download Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Download Message Bundles
echo "Please open Vim && do BundleInstall"

echo "setup is complete!"
