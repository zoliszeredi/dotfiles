alias emacs='emacs -nw'
alias runserver='python manage.py runserver 0.0.0.0:8000'
alias syncdb='python manage.py syncdb'
alias today='touch `date +%F.org`'
alias rmpyc='find . -name "*.pyc" -exec rm {} \;'
mkenv() { virtualenv $1 && source $1/bin/activate; }