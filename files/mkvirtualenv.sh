#!/bin/bash
eval HOME=${HOME}
source /etc/bash_completion.d/virtualenvwrapper;

venv_name=$1
venv_project=$2
opts=""

if [ ${venv_project} ] && [ ${venv_project} != "" ]; then
    opts="-a ${venv_project}"
fi

if [ ! -d ${WORKON_HOME}/${venv_name} ]; then
    mkvirtualenv ${opts} $1;
    deactivate;
fi
