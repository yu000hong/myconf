#!/bin/bash

dir=`dirname $0`
dir=`cd $dir > /dev/null ; pwd`
source $dir/common.sh

INSTALL_DIR=${INSTALL_DIR:-/opt}
WORK_DIR=${WORK_DIR:-~/install}

# Constants
SOFTWARE="JAVA"
URL="http://www.java.net/download/jdk7u60/archive/b15/binaries/jdk-7u60-ea-bin-b15-linux-i586-16_apr_2014.tar.gz"
FILENAME_REGEX="jdk-7*.tar.gz"
DIR_REGEX="jdk1.7*"
PROFILE=/etc/profile.d/java.sh

[ -d $WORK_DIR ] || mkdir $WORK_DIR
cd $WORK_DIR

package_exists $WORK_DIR "$FILENAME_REGEX" f
if [ $? -eq 1 ] ; then 
    wget -c $URL || {
        fail_install $SOFTWARE "Cannot download package $URL"
        exit 1
    }
fi

files=( `get_package_name $WORK_DIR "$FILENAME_REGEX" f` )
if [ ${#files[@]} -gt 1 ] ; then
    echo -e "\e[1;34m$SOFTWARE package selection:\e[0m"
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
    fail_install $SOFTWARE "No matching package"
    exit 1
fi

##############################################
#.tar.gz package
tar -xzf $packageName
packageDir=`get_package_name $WORK_DIR "$DIR_REGEX" d`
echo $packageDir
sudo mv $packageDir $INSTALL_DIR || {
    fail_install $SOFTWARE
    exit 1
}
#add profile
sudo echo "#!/bin/bash" > $PROFILE
sudo echo "#" >> $PROFILE
sudo echo "export JAVA_HOME=${INSTALL_DIR}/`basename $packageDir`" >> $PROFILE
sudo echo 'export PATH=$PATH:$JAVA_HOME/bin' >> $PROFILE
if [ $? -ne 0 ] ; then
    fail_install $SOFTWARE
    exit 1
fi
sudo . /etc/profile

success_install $SOFTWARE
