#!/bin/bash
eval HOME=${HOME}
source /etc/bash_completion.d/virtualenvwrapper;

venv_name=$1
cmd=${*:2}
current_pwd=${PWD}
workon ${venv_name}
cd ${current_pwd}
${cmd}
deactivate