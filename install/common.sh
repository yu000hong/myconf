#!/bin/bash

# find whether the binary file of the software exists
# in the installation directory
function bin_exists(){
    install_dir=$1
    bin_regex=$2
    [ -f "$install_dir/$bin_regex" ] && return 0
    return 1
}

function dir_exists(){
    install_dir=$1
    dir_regex=$2
    [ -d "$install_dir/$dir_regex" ] && return 0
    return 1
}

bin_exists . *.sh && echo "exists"
dir_exists /home/yuhong4/develop/github/myconf ins* && echo "dir"
