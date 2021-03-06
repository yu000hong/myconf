#!/bin/bash
#
#install development software on Ubuntu
#

INSTALL_DIR=${INSTALL_DIR:-~/install}
mkdir -p $INSTALL_DIR

#linux develop environment
sudo apt-get install -y build-essential
#cmake
sudo apt-get install -y cmake
#mail
sudo apt-get install -y mailutils

#SVN
sudo apt-get install -y subversion
#git
sudo apt-get install -y git git-core
#gedit
sudo apt-get install -y gedit
#vim
sudo apt-get install -y vim
#curl
sudo apt-get install -y curl
#rar unrar
sudo apt-get install -y rar unrar
#openssh-server
sudo apt-get install -y openssh-server
#htop
sudo apt-get install -y htop
#xclip
sudo apt-get install -y xclip

#Fcitx输入法安装


#python
sudo apt-get install -y python
sudo apt-get install -y python-pip

#LMAP
sudo apt-get install -y mysql-server
sudo apt-get install -y mysql-client
sudo apt-get install -y apache2
sudo apt-get install -y php5
sudo apt-get install -y libapache2-mod-php5 #配置Apache+PHP
sudo apt-get install -y php5-mysql #让PHP支持MySQL
sudo apt-get install -y libapache2-mod-auth-mysql #让Apache支持MySQL

#PHP模块
sudo apt-get install -y php5-curl #CURL模块

#NodeJS
sudo apt-get install -y nodejs
#npm package install
npm install less


#Lua
sudo apt-get install -y libreadline-dev #Lua依赖库
curl -R -O http://www.lua.org/ftp/lua-5.2.3.tar.gz
tar zxf lua-5.2.3.tar.gz
cd lua-5.2.3
make linux
sudo make install
cd $INSTALL_DIR #back to install directory

# add sudo priviledge
sudo echo "yuhong4 ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
