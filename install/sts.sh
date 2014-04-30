#!/bin/bash

INSTALL_DIR=${INSTALL_DIR:-/opt}
WORK_DIR=${WORK_DIR:-~/install}

# Constants
URL="http://dist.springsource.com/release/STS/3.5.0/dist/e4.3/spring-tool-suite-3.5.0.RELEASE-e4.3.2-linux-gtk.tar.gz"
FILENAME="spring-tool-suite-3.5.0.RELEASE-e4.3.2-linux-gtk.tar.gz"
DIR="sts-bundle"

cd $WORK_DIR
wget $URL
tar -xzf $FILENAME
sudo mv $DIR $INSTALL_DIR

