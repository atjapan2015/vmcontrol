#!/bin/bash

#usage:
# bash <(curl -s https://raw.githubusercontent.com/nagypeter/vmcontrol/master/setup-operator-workshop.sh)

echo "Setup environment for WebLogic Kubernetes Operator Workshop..."

#clean
curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/master/scripts/clean-vm.sh | bash

curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/master/scripts/install-oci.sh | bash

curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/master/scripts/install-kubectl.sh | bash

curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/master/scripts/install-git.sh | bash

#clean
curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/master/scripts/clean-vm.sh | bash

curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/master/scripts/clone-weblogic-kubernetes-operator.sh | bash

#clean
curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/master/scripts/clean-vm.sh | bash

curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/master/scripts/post-config-vm.sh | bash

echo "Setup is complete for WebLogic Kubernetes Operator Workshop."
