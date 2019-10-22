#!/bin/bash

#usage:
# curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/scripts/master/bin/install-git.sh | bash

sudo dnf install -y git

git version
