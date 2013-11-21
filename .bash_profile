#!/bin/bash

PS1="\u@[\h]$ "
PS2="> "
PATH=$PATH:$HOME/bin
EDITOR=$HOME/bin/edit
WORKON_HOME=$HOME/.envs
PIP_CONFIG_FILE=$HOME/.piprc
SSH_AGENT=$(which ssh-agent 2>/dev/null)
UNAME=$(uname -s)

export PS1 PS2 PATH EDITOR UNAME
export WORKON_HOME PIP_CONFIG_FILE 
source $HOME/.bashrc

start_ssh_agent()
{
    if [ "$SSH_AGENT_PID" == "" ]
    then
        $SSH_AGENT > $$.envs
        source $$.envs
        rm $$.envs
        ssh-add $HOME/.ssh/id_rsa
    fi
}

if [ "$UNAME" == "Linux" ]
then
    start_ssh_agent
fi
