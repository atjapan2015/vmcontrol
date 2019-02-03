#!/bin/bash

CONTENT_DIR=/u01/content/vmcontrol

echo "Check proxy settings"

sudo rm -f /etc/profile.d/setproxy.sh

GIT_SYSTEM_PROXY_CHECK=`git config --get --system http.proxy`
if [ -n "$GIT_SYSTEM_PROXY_CHECK" ]; then
  echo "Reset proxy settings for Oracle network"
  . ${CONTENT_DIR}/control/bin/setOracleProxy3.sh
else
  echo "Reset proxy settings for Non-Oracle network"
  . ${CONTENT_DIR}/control/bin/removeOracleProxy3.sh
  unset http_proxy
  unset https_proxy
fi

echo "http_proxy=$http_proxy"
echo "https_proxy=$https_proxy"

echo "========================================"
FF_SHORTCUT=~/Desktop/chrome.desktop

if grep -q "Exec=/usr/bin/firefox" $FF_SHORTCUT;
then
    echo "Firefox shortcut ready."
else
    cat > $FF_SHORTCUT <<EOF
[Desktop Entry]
Comment[en_US]=This is Firefox
Comment=This is Firefox
Exec=/usr/bin/firefox
GenericName[en_US]=Firefox
GenericName=Firefox
Icon=firefox
MimeType=
Name[en_US]=Firefox
Name=Firefox
Path=/tmp/
StartupNotify=true
Terminal=false
TerminalOptions=
Type=Application
EOF
    echo "Firefox shortcut has been created."
fi
echo "========================================"

echo "Install OCI CLI"

rm -rf /home/oracle/lib/oracle-cli

bash -c "$(curl -L https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh) --accept-all-defaults"

mkdir -p ~/.oci

echo "========================================"

echo "Prepare workshop repository..."

rm -rf /u01/content/cloud-native-devops-workshop*

rm -rf /u01/content/HOL*

cd /u01/content

rm -rf /u01/content/weblogic-kubernetes-operator

git clone https://github.com/oracle/weblogic-kubernetes-operator.git

cd /u01/content/weblogic-kubernetes-operator

git checkout v1.1

rm -f ~/.kube/config

rm -rf  /u01/weblogic-output-directory/*

rm -rf ~/.ssh/*

bash -c "$(curl -L "https://drive.google.com/uc?export=download&id=1GULaK2j-LFiCrXhwK-BYMPgFMr_nV1mU")"

echo "========================================"

echo "Install Helm..."

rm -rf ~/.helm

sudo rm -rf /usr/local/bin/helm

curl https://raw.githubusercontent.com/helm/helm/master/scripts/get > get_helm.sh

chmod 700 get_helm.sh

./get_helm.sh --version v2.8.2

helm init

rm -rf helm*

echo "========================================"

# first try to delete the rule
sudo iptables -D INPUT -i docker0 -j ACCEPT

#then add the rule necessary for docker to communicate with the host
sudo iptables -I INPUT -i docker0 -j ACCEPT

echo "iptables configured."

echo "========================================"

echo "Clean and disable yum cache/PackageKit..."

sudo rm -f /var/run/yum.pid

sudo ps -ef | grep PackageKit | grep -v grep | awk '{print $2}' | xargs -r kill -9 &

sudo yum --enablerepo=* clean all

sudo systemctl disable packagekit

echo "Everything is up to date!"
