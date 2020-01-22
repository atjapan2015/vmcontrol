#!/bin/bash

#usage:
# bash <(curl -s https://raw.githubusercontent.com/nagypeter/vmcontrol/master/setup-operator-workshop.sh)

echo "Setup environment for WebLogic Kubernetes Operator Workshop..."

curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/master/scripts/clean-vm.sh | bash

# curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/master/scripts/install-docker.sh | bash

curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/master/scripts/install-oci.sh | bash

curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/master/scripts/install-kubectl.sh | bash

curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/master/scripts/install-git.sh | bash

curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/master/scripts/clean-vm.sh | bash

curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/master/scripts/clone-weblogic-kubernetes-operator.sh | bash

echo "Setup is complete for WebLogic Kubernetes Operator Workshop."

read -p "Press [Enter] to close the window"

exit
