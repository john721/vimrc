#!/bin/sh

color_files=`find ./colortastes |grep ".vim$"`
for f in $color_files
do
	cp -v $f ./colors
done
