#!/bin/bash

declare -a softwares

# [0]: name(case-insensitive)
# [1]: version
# [2]: url(http,https,ftp,file)
# [3]: type(gz,tgz,zip,deb,sh,rar)
# [4]: filename

i=0

softwares[$i,0]="java"
softwares[$i,1]="1.7"
softwares[$i,2]="http://download.oracle.com/otn-pub/java/jdk/7u15-b03/jdk-7u15-linux-i586.tar.gz"
sofrwares[$i,3]="tgz"
softwares[$i,4]="jdk-7u15-linux-i586.tar.gz"
let i++


