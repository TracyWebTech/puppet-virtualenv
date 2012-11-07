#!/bin/bash
source /etc/bash_completion.d/virtualenvwrapper;

venv_name=$1
venv_project=$2

if [ ! -d "$WORKON_HOME/$venv_name" ]; then
    mkvirtualenv $1 $2
fi
