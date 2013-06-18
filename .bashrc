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

select_solarized_theme()
{
    CURRENT_HOUR=$(date +"%H")
    SUNSET_HOUR=18
    SUNRISE_HOUR=06
    COMMON_COLORS=$(grep -A10 Common $HOME/.solarized)
    LIGHT=$(grep -A10 Light $HOME/.solarized)
    DARK=$(grep -A10 Dark $HOME/.solarized)
    TERMINAL_THEME=$(grep -A30 terminal $HOME/.solarized)
    LS_COLORS_FILE=/tmp/$$.colors

    if [ "$CURRENT_HOUR" -gt "$SUNSET_HOUR" ] || \
       [ "$CURRENT_HOUR" -lt "$SUNRISE_HOUR" ]
    then
       NEW_THEME="$COMMON_COLORS\n$DARK\n$TERMINAL_THEME\n"
       dircolors $HOME/.dircolors.ansi-dark > $LS_COLORS_FILE
    else
       NEW_THEME="$COMMON_COLORS\n$LIGHT\n$TERMINAL_THEME\n"
       dircolors $HOME/.dircolors.ansi-light > $LS_COLORS_FILE
    fi

    echo -e "$NEW_THEME" | xrdb -merge
    source $LS_COLORS_FILE
    rm $LS_COLORS_FILE
}

if [ "$UNAME" == "Linux" ]
then
    select_solarized_theme
fi

source_if_exists $HOME/.bash_aliases
source_if_exists $VIRTUAL_ENV_WRAPPER
source_if_exists $HOME/.awsrc
run_if_exists $FORTUNE
