#!/bin/bash

#usage:
# curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/scripts/master/bin/install-kubectl.sh | bash

sudo yum install bash-completion

echo "Install kubectl..."

sudo rm -rf /usr/local/bin/kubectl

rm -rf ~/.kube

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

chmod +x ./kubectl

sudo mv ./kubectl /usr/local/bin/kubectl

echo 'source <(kubectl completion bash)' >>~/.bashrc

. ~/.bashrc

echo "========================================"

echo "Install Helm..."

rm -rf ~/.helm

sudo rm -rf /usr/local/bin/helm

curl -LO https://git.io/get_helm.sh

chmod 700 get_helm.sh

./get_helm.sh --version v2.8.2

rm -rf helm*
