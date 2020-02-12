#!/bin/bash

#usage:
# bash <(curl -s https://raw.githubusercontent.com/atjapan2015/vmcontrol/master/setup-operator-workshop.sh)

echo "Setup environment for WebLogic Kubernetes Operator Workshop..."

#clean
curl -LSs https://raw.githubusercontent.com/atjapan2015/vmcontrol/master/scripts/clean-vm.sh | bash

curl -LSs https://raw.githubusercontent.com/atjapan2015/vmcontrol/master/scripts/config-vm.sh | bash

curl -LSs https://raw.githubusercontent.com/atjapan2015/vmcontrol/master/scripts/install-oci.sh | bash

curl -LSs https://raw.githubusercontent.com/atjapan2015/vmcontrol/master/scripts/install-kubectl.sh | bash

curl -LSs https://raw.githubusercontent.com/atjapan2015/vmcontrol/master/scripts/install-git.sh | bash

curl -LSs https://raw.githubusercontent.com/atjapan2015/vmcontrol/master/scripts/clone-weblogic-kubernetes-operator.sh | bash

echo "Setup is complete for WebLogic Kubernetes Operator Workshop."

echo "Available disk size: "
df -h | awk '$NF == "/" { print $4 }'
