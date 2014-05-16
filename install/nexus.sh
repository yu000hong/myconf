#!/bin/bash

INSTALL_DIR=${INSTALL_DIR:-/opt}
WORK_DIR=${WORK_DIR:-~/install}

# Constants
URL="http://www.sonatype.org/downloads/nexus-latest-bundle.tar.gz"
FILENAME="nexus-2.8.0-05-bundle.tar.gz"
DIR="nexus-2.8.0-05-bundle/"

cd $WORK_DIR
wget $URL
tar -xzf $FILENAME
sudo mv $DIR $INSTALL_DIR


