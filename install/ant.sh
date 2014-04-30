#!/bin/bash

INSTALL_DIR=${INSTALL_DIR:-/opt}
WORK_DIR=${WORK_DIR:-~/install}

# Constants
URL="http://apache.stu.edu.tw//ant/binaries/apache-ant-1.9.3-bin.tar.gz"
FILENAME="apache-ant-1.9.3-bin.tar.gz"
DIR="apache-ant-1.9.3"
PROFILE=/etc/profile.d/ant.sh

cd $WORK_DIR
wget $URL
tar -xzf $FILENAME
sudo mv $IDR $INSTALL_DIR

sudo echo "#!/bin/bash" > $PROFILE
sudo echo "#" >> $PROFILE
sudo echo "export ANT_HOME=${INSTALL_DIR}/$DIR" >> $PROFILE
sudo echo 'export PATH=$PATH:$ANT_HOME/bin' >> $PROFILE

