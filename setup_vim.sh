#!/bin/sh

# Link the ~/.vimrc file
VIMRC_DIR=`pwd`
cd ~/
mkdir -p ~/.vim
ln -sf ${VIMRC_DIR}/vimrc    ./.vimrc
ln -sf ${VIMRC_DIR}/autoload/vim-pathogen/autoload ./.vim/
ln -sf ${VIMRC_DIR}/bundle   ./.vim/
cd -
