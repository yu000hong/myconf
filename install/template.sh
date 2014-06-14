#!/bin/bash

dir=`dirname $0`
dir=`cd $dir > /dev/null ; pwd`
source $dir/common.sh

INSTALL_DIR=${INSTALL_DIR:-/opt}
WORK_DIR=${WORK_DIR:-~/install}

# Constants
MODULE="template"
URL="http://.......tar.gz"
FILENAME_REGEX="template*.tar.gz"
DIR_REGEX="template*"
PROFILE=/etc/profile.d/java.sh

[ -d $WORK_DIR ] || mkdir $WORK_DIR
cd $WORK_DIR

package_exists $WORK_DIR "$FILENAME_REGEX" f
if [ $? -eq 1 ] ; then 
    wget -c $URL || (echo 'Cannot download package $URL';exit 1)
fi

files=( `get_package_name $WORK_DIR "$FILENAME_REGEX" f` )
if [ ${#files[@]} -gt 1 ] ; then
    echo -e "\e[1;34m$MODULE package selection:\e[0m"
    select packageName in ${files[@]}
    do
        if [ "$packageName" != "" ] ; then
            break
        else
            echo "Please choose the right number."
        fi
    done
elif [ ${#files[@]} -eq 1 ] ; then
    packageName=${files[0]}
else
    echo "No matching package"
    exit 1
fi

echo "package: $packageName"
exit 0

##############################################
#.deb package
sudo dpkg -i $packageName
if [ $? -eq 0 ] ; then
    echo -e "\e[1;34mSuccess to install $MODULE.\e[0m"
    exit 0
else
    echo -e "\e[1;41mFail to install $MODULE.\e[0m"
    exit 1
fi

##############################################
#.tar.gz package
tar -xzf $packageName
packageDir=`get_package_name $WORKDIR "$DIR_REGEX" d`
sudo mv $packageDir $INSTALL_DIR
#add profile
sudo echo "#!/bin/bash" > $PROFILE
sudo echo "#" >> $PROFILE
sudo echo "export JAVA_HOME=${INSTALL_DIR}/`basename $packageDir`" >> $PROFILE
sudo echo 'export PATH=$PATH:$JAVA_HOME/bin' >> $PROFILE
sudo source /etc/profile

