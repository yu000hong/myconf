#!/bin/bash

INSTALL_DIR=${INSTALL_DIR:-/opt}
WORK_DIR=${WORK_DIR:-~/install}

# Constants
URL="http://download.oracle.com/otn-pub/java/jdk/7u15-b03/jdk-7u15-linux-i586.tar.gz"
FILENAME="jdk-7u15-linux-i586.tar.gz"
DIR="jdk-7u15-linux-i586"
PROFILE=/etc/profile.d/java.sh

cd $WORK_DIR
wget $URL
tar -xzf $FILENAME
sudo mv $IDR $INSTALL_DIR

sudo echo "#!/bin/bash" > $PROFILE
sudo echo "#" >> $PROFILE
sudo echo "export JAVA_HOME=${INSTALL_DIR}/$DIR" >> $PROFILE
sudo echo 'export PATH=$PATH:$JAVA_HOME/bin' >> $PROFILE

