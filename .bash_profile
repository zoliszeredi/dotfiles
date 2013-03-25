#!/bin/bash

PS1="\u@[\h]$ "
PATH=$PATH:$HOME/bin
WORKON_HOME=$HOME/.envs
PIP_CONFIG_FILE=$HOME/.pip

export PS1 PATH WORKON_HOME PIP_CONFIG_FILE

source $HOME/.bashrc

