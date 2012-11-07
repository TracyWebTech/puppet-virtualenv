#!/bin/bash
eval HOME=${HOME}
source /etc/bash_completion.d/virtualenvwrapper;

venv_name=$1
cmd=${*:2}
workon ${venv_name}
${cmd}
deactivate