#!/bin/bash

INSTALL_DIR=${INSTALL_DIR:-/opt}
WORK_DIR=${WORK_DIR:-~/install}

# Constants
URL="http://mirrors.yun-idc.com/eclipse//technology/epp/downloads/release/kepler/SR2/eclipse-jee-kepler-SR2-linux-gtk.tar.gz"
FILENAME="eclipse-jee-kepler-SR2-linux-gtk.tar.gz"
DIR="eclipse"

cd $WORK_DIR
wget $URL
tar -xzf $FILENAME
sudo mv $DIR $INSTALL_DIR

