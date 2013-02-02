#!/bin/bash

TERM="xterm-256color"
VIRTUAL_ENV_WRAPPER=$(which "virtualenvwrapper.sh" 2> /dev/null)
FORTUNE=$(which fortune > /dev/null)

export TERM

source_if_exists $HOME/.bash_aliases
source_if_exists $VIRTUAL_ENV_WRAPPER
run_if_exists $FORTUNE

