#!/bin/bash

INSTALL_DIR=${INSTALL_DIR:-/opt}
WORK_DIR=${WORK_DIR:-~/install}

# Constants
URL="http://dl.google.com/android/studio/install/0.4.6/android-studio-bundle-133.1028713-linux.tgz"
FILENAME="android-studio-bundle-133.1028713-linux.tgz"
DIR="eclipse"

cd $WORK_DIR
wget $URL
tar -xzf $FILENAME
sudo mv $DIR $INSTALL_DIR

