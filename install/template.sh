#!/bin/bash

dir=`dirname $0`
dir=`cd $dir > /dev/null ; pwd`
source $dir/common.sh

INSTALL_DIR=${INSTALL_DIR:-/opt}
WORK_DIR=${WORK_DIR:-~/install}

# Constants
URL="http://.......tar.gz"
FILENAME="jdk-7*.tar.gz"
DIR="jdk-7*"
PROFILE=/etc/profile.d/java.sh

[ -d $WORKDIR ] || mkdir $WORKDIR
cd $WORKDIR

packege_exists $WORKDIR $FILENAME 'f'
if [ $? -eq 1 ] ; then 
    wget -c $URL || (echo 'Cannot download package from internet,';exit 1)
fi

package=`get_package_name $WORKDIR $FILENAME 'f'`

################################################################################
#.deb package
sudo dpkg -i $package
exit 0
###############################################################################
#.tar.gz 
tar -xzf $package
package_dir=`get_package_name $WORKDIR $DIR 'd'`
sudo mv $package_dir $INSTALL_DIR
#add profile
sudo echo "#!/bin/bash" > $PROFILE
sudo echo "#" >> $PROFILE
sudo echo "export JAVA_HOME=${INSTALL_DIR}/`basename $package_dir`" >> $PROFILE
sudo echo 'export PATH=$PATH:$JAVA_HOME/bin' >> $PROFILE

