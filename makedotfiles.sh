#!/bin/bash
############################
# .make.sh
# This script creates dotfiles from ~/lib/dotfiles
############################

ln -sf ~/lib/dotfiles/profile ~/.profile
ln -sf ~/lib/dotfiles/gitignore_global ~/.gitignore_global
ln -sf ~/lib/dotfiles/vim ~/.vim/
ln -sf ~/lib/dotfiles/vimrc ~/.vimrc

source ~/.profile
