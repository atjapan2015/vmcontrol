#!/bin/bash

#usage:
# curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/master/setup-operator-workshop.sh | bash

echo "Setup environment for WebLogic Kubernetes Operator Workshop..."

curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/master/scripts/install-docker.sh | bash

curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/master/scripts/install-oci.sh | bash

curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/master/scripts/install-kubectl.sh | bash

curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/master/scripts/install-git.sh | bash

curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/master/scripts/clone-weblogic-kubernetes-operator.sh | bash

read -p "Setup complete for WebLogic Kubernetes Operator Workshop. Press [Enter] to close the window"
