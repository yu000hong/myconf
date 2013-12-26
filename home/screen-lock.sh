#!/bin/bash

source ~/.DBUS_temp

export DBUS_SESSION_BUS_ADDRESS


# You need to install package "libnotify-bin",
# in order to use notify-send.
# 
# sudo apt-get install libnotify-bin
#
# send notification before locking the screen.
notify-send 锁屏警告 "<font size=6 color=red><b>系统将在一分钟后锁屏，请休息一会！</b></font>"

# sleep 60 seconds
sleep 60

# You need to install package "gnome-screensaver",
# in order to use gnome-screensaver-command.
#
# sudo apt-get install gnome-screensaver
#
/usr/bin/gnome-screensaver-command -l
