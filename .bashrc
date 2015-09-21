#!/bin/bash

source $HOME/.bash_profile

# TERM="xterm-256color"
VIRTUAL_ENV_WRAPPER=$(which "virtualenvwrapper.sh" 2> /dev/null)

if [[ $(uname) == "Linux" ]]
then
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
fi
