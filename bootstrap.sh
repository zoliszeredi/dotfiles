#!/bin/sh

DOTENTRIES=`ls -a | egrep '^\.'`

for dotent in $DOTENTRIES
do
	if [ -f $dotent ]
	then
		CMD="cp -f $dotent $HOME/$dotent"
		echo $CMD
		`$CMD`
	fi
done

