#!/bin/bash

# config VM

echo "Disable package cache"
sudo sed "s|#KeepCache=false|KeepCache=false|g" -i /etc/PackageKit/PackageKit.conf
