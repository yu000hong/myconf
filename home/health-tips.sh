#!/bin/bash

if [ $# -ne 1 ] ; then
	echo "Need 1 parameter: ACTION"
	exit -1
fi

ACTION=$1

# export X window variable: DBUS_SESSION_BUS_ADDRESS
source ~/.DBUS_temp
export DBUS_SESSION_BUS_ADDRESS


case $ACTION in
	1)
	notify-send 健康提示 "<font size=6 color=red><b>转动转动脖子！一分钟！</b></font>"
	;;
	2)
	notify-send 健康提示 "<font size=6 color=red><b>休息下眼睛，看看窗外！三分钟！</b></font>"
	;;
	3)
	notify-send 健康提示 "<font size=6 color=red><b>起来走动走动，绕一圈！</b></font>"
	;;
	*)
	#do nothing
	:
	;;
esac
