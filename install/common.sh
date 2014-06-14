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

#demo
#package_exists /home/yuhong4/install 'java-7-*.tar.gz' f
#get_package_name /home/yuhong4/install 'java-7-*.tar.gz' f
