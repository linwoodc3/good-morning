#!/bin/bash

if [[ $TRAVIS_OS_NAME == 'osx' ]]; then

    # Install some custom requirements on OS X
    # e.g. brew install pyenv-virtualenv


    case "${GDELT}" in
        py34)
            # Install some custom Python 3.4 requirements on OS X
            pip install pip -U
            brew install python3
            alias python='python3'
            ;;
        py35)
            # Install some custom Python 3.5 requirements on OS X
            pip install pip -U
            brew install python3
            alias python='python3'
            ;;
        py36)
            # Install some custom Python 3.6 requirements on OS X
            pip install pip -U
            brew install python3
            alias python='python3'
            ;;
    esac
else
    # Install some custom requirements on Linux

    sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
    sudo apt-get update -q -y
    sudo apt-get install python-dev -y
    sudo apt-get clean	-y
pip install numpy -U
pip install -r requirements.txt
fi;