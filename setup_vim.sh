#!/bin/sh

# Link the ~/.vimrc file
VIMRC_DIR=`pwd`
cd ~/; ln -sf ${VIMRC_DIR}/vimrc .vimrc; cd -

# Copy plug-in files to where it should be
PLUGIN_FILES=`find ${VIMRC_DIR} -name *.vim`
cd ~/.vim/plugin
for f in ${PLUGIN_FILES}
do
	ln -sf ${f} ./
done
cd -
