#!/bin/bash

source /etc/bash_completion.d/virtualenvwrapper;

venv_name=$1
package_name=$2
#venv_path=$HOME/.virtualenvs
venv_path=$WORKON_HOME

pip install --environment=$venv_path/$venv_name -r $package_name