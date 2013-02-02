#!/bin/bash

TERM="xterm-256color"
VIRTUAL_ENV_WRAPPER=$(which "virtualenvwrapper.sh" 2> /dev/null)
FORTUNE=$(which fortune 2> /dev/null)

export TERM

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

source_if_exists $HOME/.bash_aliases
source_if_exists $VIRTUAL_ENV_WRAPPER
run_if_exists $FORTUNE

