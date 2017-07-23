#!/bin/bash

if [[ $TRAVIS_OS_NAME == 'osx' ]]; then

    # Install some custom requirements on OS X
    # e.g. brew install pyenv-virtualenv
    brew install python3
    echo alias python='python3' >>~/.bash_profile
    echo alias pip='pip3' >>~/.bash_profile
    source ~/.bash_profile

    case "${GDELT}" in
        py34)
            # Install some custom Python 3.4 requirements on OS X
            pip install pip -U
            python setup.py install
            ;;
        py35)
            # Install some custom Python 3.5 requirements on OS X
            pip install pip -U
            python setup.py install
            ;;
        py36)
            # Install some custom Python 3.6 requirements on OS X
            pip install pip -U
            python setup.py install
            ;;
    esac
else
    # Install some custom requirements on Linux

    sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
    sudo apt-get update -q -y
    sudo add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable -y
    sudo apt-get install python-dev -y
    sudo apt-get install gcc-4.8 -y
    sudo apt-get clean	-y
fi

if [ "$GDELT" == py27 ]; then
        echo 'geo testing'; pip install -r requirements_geo.txt;
        else pip install -r requirements.txt;
fi;