#!/bin/bash

PS1="\u@\h$ "
PATH=$PATH:$HOME/bin
WORKON_HOME=$HOME/.envs

export PS1 PATH WORKON_HOME

source $HOME/.bashrc

