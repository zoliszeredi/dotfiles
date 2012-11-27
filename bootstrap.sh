#!/bin/sh

FILES=".vimrc \
	.emacs \
	.gitconfig"

for dotfile in $FILES
do
	if [ -f "$dotfile" ]
	then 	
		cp -vf "$dotfile" "$HOME"
	else
		echo "$dotfile" not found
	fi
done

