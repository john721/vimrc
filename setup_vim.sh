#!/bin/sh

mkdir -p colors
# Link the ~/.vimrc file
VIMRC_DIR=`pwd`
cd ~/
mkdir -p ~/.vim
ln -sf ${VIMRC_DIR}/vimrc               ./.vimrc
ln -sf ${VIMRC_DIR}/autoload/vim-pathogen/autoload ./.vim/
ln -sf ${VIMRC_DIR}/bundle              ./.vim/
ln -sf ${VIMRC_DIR}/colors              ./.vim/
ln -sf ${VIMRC_DIR}/cscope_quickfix.vim ./.vim/
[ -e ~/.vimrc_custom ] || touch ~/.vimrc_custom  
cd -

