#!/bin/sh

# Link the ~/.vimrc file
VIMRC_DIR=`pwd`
cd ~/
mkdir -p ~/.vim
ln -sf ${VIMRC_DIR}/vimrc    ./.vimrc
ln -sf ${VIMRC_DIR}/autoload/vim-pathogen/autoload ./.vim/
ln -sf ${VIMRC_DIR}/bundle   ./.vim/
wget http://cscope.sourceforge.net/cscope_maps.vim -O ${VIMRC_DIR}/cscope_maps.vim
ln -sf ${VIMRC_DIR}/cscope_maps.vim ./.vim/
[ -e ~/.vimrc_custom ] || touch ~/.vimrc_custom  
cd -

