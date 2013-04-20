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
    COMMON_COLORS=$(grep -A10 Common $HOME/.solarized)
    LIGHT=$(grep -A10 Light $HOME/.solarized)
    DARK=$(grep -A10 Dark $HOME/.solarized)
    TERMINAL_THEME=$(grep -A30 terminal $HOME/.solarized)

    if [ "$CURRENT_HOUR" -gt "$SUNSET_HOUR" ]
    then
       echo "$COMMON_COLORS $DARK $TERMINAL_THEME" | xrdb -merge
    else 
       echo "$COMMON_COLORS $LIGHT $TERMINAL_THEME" | xrdb -merge
    fi

}


select_solarized_theme
source_if_exists $HOME/.bash_aliases
source_if_exists $VIRTUAL_ENV_WRAPPER
# run_if_exists $FORTUNE
