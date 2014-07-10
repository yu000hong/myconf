#!/bin/bash

dir=`dirname $0`
dir=`cd $dir > /dev/null ; pwd`
source $dir/common.sh

INSTALL_DIR=${INSTALL_DIR:-/opt}
WORK_DIR=${WORK_DIR:-~/install}

# Constants
SOFTWARE="gradle"
URL="https://services.gradle.org/distributions/gradle-2.0-all.zip"
FILENAME_REGEX="gradle-*.zip"
DIR_REGEX="gradle*"
PROFILE=/etc/profile.d/gradle.sh

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

#######################################
#.zip package
unzip $packageName -d .
packageDir=`get_package_name $WORK_DIR "$DIR_REGEX" d`
sudo mv $packageDir $INSTALL_DIR || {
    fail_install $SOFTWARE
    exit 1
}
packageDirname=`basename $packageDir`
sudo chown -R $CURRENT_USER:$CURRENT_GROUP $INSTALL_DIR/$packageDirname

#add profile
sudo echo "#!/bin/bash" > $PROFILE
sudo echo "#" >> $PROFILE
sudo echo "export GRADLE_HOME=${INSTALL_DIR}/`basename $packageDir`" >> $PROFILE
sudo echo 'export PATH=$PATH:$GRADLE_HOME/bin' >> $PROFILE
if [ $? -ne 0 ] ; then
    fail_install $SOFTWARE
    exit 1
fi
. /etc/profile

success_install $SOFTWARE
