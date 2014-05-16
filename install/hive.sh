#!/bin/bash

INSTALL_DIR=${INSTALL_DIR:-/opt}
WORK_DIR=${WORK_DIR:-~/install}

# Constants
URL="http://apache.stu.edu.tw/hive/stable/apache-hive-0.13.0-bin.tar.gz"
FILENAME="apache-hive-0.13.0-bin.tar.gz"
DIR="apache-hive-0.13.0-bin"
PROFILE=/etc/profile.d/hive.sh

cd $WORK_DIR
wget $URL
tar -xzf $FILENAME
sudo mv $DIR $INSTALL_DIR

sudo echo "#!/bin/bash" > $PROFILE
sudo echo "#" >> $PROFILE
sudo echo "export HIVE_HOME=${INSTALL_DIR}/$DIR" >> $PROFILE
sudo echo 'export PATH=$PATH:$HIVE_HOME/bin' >> $PROFILE

#create /tmp and /user/hive/warehouse (aka hive.metastore.warehouse.dir) 
#and set them chmod g+w in HDFS before you can create a table in Hive.
$HADOOP_HOME/bin/hadoop fs -mkdir /tmp
$HADOOP_HOME/bin/hadoop fs -mkdir /user/hive/warehouse
$HADOOP_HOME/bin/hadoop fs -chmod g+w /tmp
$HADOOP_HOME/bin/hadoop fs -chmod g+w /user/hive/warehouse

