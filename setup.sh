#!/bin/bash

DOT_FILES=(.bash_logout .bash_profile .bashrc .cshrc .gitconfig .gitignore .tcshrc .tmux.conf .vimrc)

for file in ${DOT_FILES[@]}
do
    ln -sf $HOME/dotfiles/$file $HOME/$file
    echo "make link $HOME/dotfiles/$file -> $HOME/$file"
done
echo "setup is done!"
