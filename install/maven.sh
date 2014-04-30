#!/bin/bash

INSTALL_DIR=${INSTALL_DIR:-/opt}
WORK_DIR=${WORK_DIR:-~/install}

# Constants
URL="http://mirrors.cnnic.cn/apache/maven/maven-3/3.2.1/binaries/apache-maven-3.2.1-bin.tar.gz"
FILENAME="apache-maven-3.2.1-bin.tar.gz"
DIR="apache-maven-3.2.1"
PROFILE=/etc/profile.d/maven.sh

cd $WORK_DIR
wget $URL
tar -xzf $FILENAME
sudo mv $IDR $INSTALL_DIR

sudo echo "#!/bin/bash" > $PROFILE
sudo echo "#" >> $PROFILE
sudo echo "export M2_HOME=${INSTALL_DIR}/$DIR" >> $PROFILE
sudo echo 'export PATH=$PATH:$M2_HOME/bin' >> $PROFILE

