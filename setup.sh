#!/bin/bash

# Setup vim
echo "Download Vundle"
mkdir -pv "${HOME}"/.vim/{bundle,undo,colors}
git clone https://github.com/VundleVim/Vundle.vim.git "${HOME}/.vim/bundle/Vundle.vim"

# Configure vim
echo "Configuring vim"
cp -v assets/wombat256.vim "${HOME}/.vim/colors"
cp -v .vimrc "${HOME}"

# Add remaining dotfiles
cp -v .better-commits.json .zshrc "${HOME}"
