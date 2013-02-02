#!/bin/bash

PS1="\u@\h$ "
PATH=$PATH:$HOME/bin
WORKON_HOME=$HOME/.envs

export PS1 PATH

source_if_exists()
{
    SOURCE_FILE=$1

    if [ "$SOURCE_FILE" != "" ] && [ -f $SOURCE_FILE ]
    then
	source $SOURCE_FILE
    fi
}

run_if_exists()
{
    RUN_FILE=$1
    
    if [ "$RUN_FILE" != "" ] && [ -f $RUN_FILE ]
    then
	$RUN_FILE
    fi
}
 
source_if_exists $HOME/.bashrc

