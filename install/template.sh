#!/bin/bash

dir=`dirname $0`
dir=`cd $dir > /dev/null ; pwd`
source $dir/common.sh

INSTALL_DIR=${INSTALL_DIR:-/opt}
WORK_DIR=${WORK_DIR:-~/install}

# Constants
SOFTWARE="template"
URL="http://.......tar.gz"
FILENAME_REGEX="template*.tar.gz"
DIR_REGEX="template*"
PROFILE=/etc/profile.d/template.sh

#make sure that the work directory does exist
[ -d $WORK_DIR ] || mkdir $WORK_DIR
cd $WORK_DIR

#if package file does not 
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

echo "package: $packageName"
exit 0

##############################################
#.deb package
sudo dpkg -i $packageName
if [ $? -eq 0 ] ; then
    success_install $SOFTWARE
    exit 0
else
    fail_install $SOFTWARE
    exit 1
fi

#######################################
#.zip package
unzip $packageName -d template
packageDir=`get_package_name $WORK_DIR "$DIR_REGEX" d`
sudo mv $packageDir $INSTALL_DIR || {
    fail_install $SOFTWARE
    exit 1
}

##############################################
#.tar.gz package
tar -xzf $packageName
packageDir=`get_package_name $WORK_DIR "$DIR_REGEX" d`
sudo mv $packageDir $INSTALL_DIR || {
    fail_install $SOFTWARE
    exit 1
}

#add profile
sudo echo "#!/bin/bash" > $PROFILE
sudo echo "#" >> $PROFILE
sudo echo "export TEMPLATE_HOME=${INSTALL_DIR}/`basename $packageDir`" >> $PROFILE
sudo echo 'export PATH=$PATH:$TEMPLATE_HOME/bin' >> $PROFILE
if [ $? -ne 0 ] ; then
    fail_install $SOFTWARE
    exit 1
fi
. /etc/profile

success_install $SOFTWARE
