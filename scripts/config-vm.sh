#!/bin/bash

# config VM

# clean up and disable PackageKit
echo "Cleanup PackageKit..."
pkcon refresh force -c -1
echo "Disable packagekit (autoupdate)"
sudo systemctl stop packagekit
sudo systemctl mask packagekit
