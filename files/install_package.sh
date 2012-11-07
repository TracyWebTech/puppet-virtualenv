#!/bin/bash

source /etc/bash_completion.d/virtualenvwrapper;

venv_name=$1
package_name=$2
#venv_path=$HOME/.virtualenvs
venv_path=$WORKON_HOME

echo "pip install --environment=$venv_path/$venv_name $package_name" > /tmp/wrapper_debug

pip install --environment=$venv_path/$venv_name $package_name