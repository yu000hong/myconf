#!/bin/bash

INSTALL_DIR=${INSTALL_DIR:-/opt}
WORK_DIR=${WORK_DIR:-~/install}

# Constants
URL="https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb"
FILENAME="google-chrome-stable_current_i386.deb"

cd $WORK_DIR
wget $URL
if [ ! $? -eq 0 ]; then
    echo "Fail to download chrome deb package."
    exit -1
fi

sudo dpkg -i $FILENAME
