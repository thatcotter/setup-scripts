#!/usr/bin/env bash  

# install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
sudo easy_install pip

echo "Installing Python packages..."  
PYTHON_PACKAGES=(  
    virtualenv  
    virtualenvwrapper 
    speedtest-cli 
    ansible
	ansible-core 
	cffi
	cryptography 
	Jinja2
	MarkupSafe
	packaging
	pip
	pycparser
	pyparsing
	PyYAML
	resolvelib
	setuptools
)  
pip install ${PYTHON_PACKAGES[@]}