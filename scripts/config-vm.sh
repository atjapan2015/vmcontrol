#!/bin/bash

# config VM

#echo "Disable package cache"
#sudo sed "s|#KeepCache=false|KeepCache=false|g" -i /etc/PackageKit/PackageKit.conf

# create crontab to clean packages
(crontab -l 2>/dev/null | fgrep -v "*/10 * * * * pkcon refresh force -c -1 >/dev/null 2>&1"; echo "*/10 * * * * pkcon refresh force -c -1 >/dev/null 2>&1") | crontab -
