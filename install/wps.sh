#!/bin/bash

INSTALL_DIR=${INSTALL_DIR:-/opt}
WORK_DIR=${WORK_DIR:-~/install}

# Constants
URL="http://wdl1.cache.wps.cn/wps/download/Linux/unstable/wps-office_8.1.0.3724~b1p2_i386.deb"
FILENAME="wps-office_8.1.0.3724~b1p2_i386.deb"

cd $WORK_DIR
wget $URL

sudo dpkg -i $FILENAME
