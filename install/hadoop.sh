#!/bin/bash

INSTALL_DIR=${INSTALL_DIR:-/opt}
WORK_DIR=${WORK_DIR:-~/install}

# Constants
URL="http://www.java.net/download/jdk7u60/archive/b15/binaries/jdk-7u60-ea-bin-b15-linux-i586-16_apr_2014.tar.gz"
FILENAME="jdk-7u15-linux-i586.tar.gz"
DIR="jdk-7u15-linux-i586"
PROFILE=/etc/profile.d/java.sh

cd $WORK_DIR
wget $URL
tar -xzf $FILENAME
sudo mv $DIR $INSTALL_DIR

sudo echo "#!/bin/bash" > $PROFILE
sudo echo "#" >> $PROFILE
sudo echo "export JAVA_HOME=${INSTALL_DIR}/$DIR" >> $PROFILE
sudo echo 'export PATH=$PATH:$JAVA_HOME/bin' >> $PROFILE

