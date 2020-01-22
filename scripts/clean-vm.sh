#!/bin/bash

# cleanup

echo "Delete google-noto-cjk-fonts to free up disk space..."

sudo rm -rf /usr/share/fonts/google-noto-cjk
sudo yum remove google-noto-cjk-fonts

echo "Cleanup PackageKit..."

pkcon refresh force -c -1

echo "Available disk size: "
df -h | awk '$NF == "/" { print $4 }'
