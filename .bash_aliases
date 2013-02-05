#!/bin/bash

alias emacs='emacs -nw'
alias today='touch `date +%F.org`'

mkenv() 
{
    if [ $# -ne 1 ]
    then
	echo "mkenv <path_to_new_environment>"
	echo "Creates a virtual environment in the specified path"
	return 0
    fi
       
    virtualenv $1
    source $1/bin/activate
}

rmenv()
{
    if [ -z $VIRTUAL_ENV ]
    then
	echo "Not in a virtual environment."
	return 0
    fi

    rm -rf $VIRTUAL_ENV
    deactivate
}

djenv() 
{ 
    if [ $# -ne 1 ]
    then
	echo "djenv <project>"
	echo "Sets the variables:"
	echo "DJANGO_SETTINGS_MODULE : '<project>.settings'"
	echo "PYTHONPATH : \$VIRTUAL_ENV/lib/python2.7/site-packages/<project>"
	return 0
    fi

    PROJ=$1
    PROJ_PREFIX=$VIRTUAL_ENV/lib/python2.7/site-packages
    PYTHONPATH=$PROJ_PREFIX/$PROJ
    DJANGO_ROOT=$(find $PYTHONPATH -name 'settings.py' -exec dirname {} \;)
    DJANGO_SETTINGS_MODULE=${DJANGO_ROOT##*/}.settings
    DJANGO_SETTINGS=$DJANGO_ROOT/settings.py
    export PYTHONPATH DJANGO_SETTINGS_MODULE DJANGO_ROOT DJANGO_SETTINGS
}

djprep()
{
    if [ -z $VIRTUAL_ENV ]
    then
	echo "Not in a virtual environment."
	return 0
    fi

    django-admin.py syncdb
    django-admin.py migrate
    django-admin.py collectstatic
}

djrun()
{
    if [ -z $VIRTUAL_ENV ]
    then
	echo "Not in a virtual/django environment."
	return 1
    fi

    django-admin.py runserver 0:8000
}

djsh()
{
    if [ -z $DJANGO_SETTINGS ]
    then
	echo "Run djenv first"
	return 1
    fi

    django-admin.py shell
}

djdebug()
{
    if [ -z $DJANGO_SETTINGS ]
    then
	echo "Run djenv first"
	return 1
    fi

    sed 's/DEBUG \= False/DEBUG \= True/g' < $DJANGO_SETTINGS > $$
    mv $$ $DJANGO_SETTINGS
}

djnodebug()
{
    if [ -z $DJANGO_SETTINGS ]
    then
	echo "Run djenv first"
	return 1
    fi

    sed 's/DEBUG \= True/DEBUG \= False/g' < $DJANGO_SETTINGS > $$
    mv $$ $DJANGO_SETTINGS
}

