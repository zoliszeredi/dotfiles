#!/bin/bash

TERM="xterm-256color"
ENV_WRAP=`which virtualenvwrapper.sh > /dev/null`

export TERM
source $HOME/.bash_aliases
if [ -f $ENV_WRAP ]
then
    source $ENV_WRAP
fi

fortune
