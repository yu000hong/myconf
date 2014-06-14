#!/bin/bash

dir=`dirname $0`
dir=`cd $dir > /dev/null ; pwd`
source $dir/common.sh

INSTALL_DIR=${INSTALL_DIR:-/opt}
WORK_DIR=${WORK_DIR:-~/install}

# Constants
SOFTWARE="Intellij IDEA"
URL="http://download-cf.jetbrains.com/idea/ideaIC-13.1.3.tar.gz"
FILENAME_REGEX="ideaIC*.tar.gz"
DIR_REGEX="idea-IC**"
PROFILE=/etc/profile.d/idea.sh

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
sudo mv $packageDir $INSTALL_DIR || {
    fail_install $SOFTWARE
    exit 1
}
success_install $SOFTWARE
