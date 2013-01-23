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
    DJANGO_PROJ=$1
    PYTHONPATH=$VIRTUAL_ENV/lib/python2.7/site-packages/$DJANGO_PROJ
    DJANGO_SETTINGS_MODULE=$DJANGO_PROJ.settings
    export PYTHONPATH DJANGO_PROJ DJANGO_SETTINGS_MODULE
}

#
# TODO place django in debug/nodebug mode 
#
# djdebug()
# {
#     sed s/DEBUG \= False/DEBUG \= True/g < $PYTHONPATH
# }
# 
# djnodebug()
# {
#     sed s/DEBUG \= True/DEBUG \= False/g
# }
#

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

