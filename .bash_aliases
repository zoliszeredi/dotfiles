#!/bin/sh

alias emacs='emacs -nw'
alias today='touch `date +%F.org`'

mkenv() 
{ 
    virtualenv $1
    source $1/bin/activate
}

rmenv()
{
    rm -rf $VIRTUAL_ENV
    deactivate
}

djenv() 
{ 
    PYTHONPATH=$VIRTUAL_ENV/lib/python2.7/site-packages/$1
    DJANGO_SETTINGS_MODULE=$1.settings
    export PYTHONPATH DJANGO_SETTINGS_MODULE
}

djprep()
{
    django-admin.py syncdb
    django-admin.py migrate
    django-admin.py collectstatic
}

djrun()
{
    django-admin.py runserver 0:8000
}

