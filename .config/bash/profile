#!/bin/bash

PS1="\u@[\h]$ "
PS2="> "
PATH=$PATH:$HOME/bin
EDITOR=$HOME/bin/edit
PIP_CONFIG_FILE=$HOME/.piprc

export PS1 PS2 PATH EDITOR
export PIP_CONFIG_FILE

source_nix () {
    local nix_profile

    nix_profile="$HOME/.nix-profile/etc/profile.d/nix.sh"
    [[ -e $nix_profile ]] && . "$nix_profile"
}

emc () {
    emacsclient -a "" $*;
}


source_nix
