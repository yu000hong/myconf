#!/bin/bash

function package_exists(){
    workdir=$1
    file=$2
    type=$3
    found=( `find $workdir -maxdepth 1 -iname "$file" -type $type` )
    if [ ${#found[@]} -gt 1 ] ; then
        return 2
    elif [ ${#found[@]} -eq 0 ] ; then
        return 1
    else
        return 0
    fi
}

function get_package_name(){
    workdir=$1
    file=$2
    type=$3
    find $workdir -maxdepth 1 -iname "$file" -type $type
}

function success_install(){
    software=$1
    echo -e "\e[1;34mSuccess to install software [$software]\e[0m"
}

function fail_install(){
    software=$1
    message=$2
    echo -e "\e[1;41mFail to install software [$software]\e[0m"
    if [ "$message" != "" ] ; then
        echo -e "\e[1;41mCause: $message\e[0m"
    fi
}

#test
#success_install java
#fail_install java "i don't know reason."

#test
#package_exists /home/yuhong4/install 'java-7-*.tar.gz' f
#get_package_name /home/yuhong4/install 'java-7-*.tar.gz' f
