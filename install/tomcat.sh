#!/bin/bash

INSTALL_DIR=${INSTALL_DIR:-/opt}
WORK_DIR=${WORK_DIR:-~/install}

# Constants
URL="http://mirror.esocc.com/apache/tomcat/tomcat-7/v7.0.53/bin/apache-tomcat-7.0.53.tar.gz"
FILENAME="apache-tomcat-7.0.53.tar.gz"
DIR="apache-tomcat-7.0.53"
PROFILE=/etc/profile.d/tomcat.sh

cd $WORK_DIR
wget $URL
tar -xzf $FILENAME
sudo mv $DIR $INSTALL_DIR

sudo echo "#!/bin/bash" > $PROFILE
sudo echo "#" >> $PROFILE
sudo echo "export CATALINA_HOME=${INSTALL_DIR}/$DIR" >> $PROFILE

