#!/bin/bash

DOTENTRIES=$(ls -a | egrep '^\.')
XFILES=$(ls -a | egrep '\.(x|X)')
UNAME=$(uname -s)

for DOTENTRY in $DOTENTRIES
do
    if [ -f $DOTENTRY ]
    then
	IS_X_FILE=$(echo $XFILES | grep $DOTENTRY)
        if [ ! -z $IS_X_FILE ] && [ $(uname) == "Darwin" ]
	then
	    continue
	fi
        
        CMD="cp -Rf $DOTENTRY $HOME/$DOTENTRY" && echo $CMD && $CMD
    fi
done
