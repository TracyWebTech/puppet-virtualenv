#!/bin/bash
eval HOME=${HOME}
source /etc/bash_completion.d/virtualenvwrapper

venv_name=$1
cmd=${*:2}
. $WORKON_HOME/$venv_name/bin/activate
${cmd}
deactivate
