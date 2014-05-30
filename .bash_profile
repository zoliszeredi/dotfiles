#!/bin/bash

PS1="\u@[\h]$ "
PS2="> "
PATH=$PATH:$HOME/bin
WORKON_HOME=$HOME/.envs
EDITOR=$HOME/bin/edit
PIP_CONFIG_FILE=$HOME/.piprc
UNAME=$(uname -s)

export PS1 PS2 PATH EDITOR UNAME
export WORKON_HOME PIP_CONFIG_FILE

emc () {
    emacsclient -a "" $*;
}
