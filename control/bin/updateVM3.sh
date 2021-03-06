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
    echo "Firefox shortcut is ready."
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
#OCI cli is not necessary for OOW19 HOLs, temporary switched off
echo "Install OCI CLI"

rm -rf /home/oracle/lib/oracle-cli

rm -f /home/oracle/oci_install.sh

curl -L https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh --output /home/oracle/oci_install.sh

chmod 755 /home/oracle/oci_install.sh

/home/oracle/oci_install.sh --accept-all-defaults

rm -f /home/oracle/oci_install.sh

mkdir -p ~/.oci

echo "========================================"

echo "Prepare workshop repository..."

rm -rf /u01/content/cloud-native-devops-workshop*

rm -rf /u01/content/HOL*

rm -rf /u01/workspace/*

rm -rf /u01/content/weblogic-kubernetes-operator

rm -f ~/.kube/config

rm -rf  /u01/weblogic-output-directory/*

rm -rf ~/.ssh/*

cd /u01/content

/u01/content/vmcontrol/control/bin/updateGitOnly.sh

echo "========================================"

echo "Install kubectl..."

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

chmod +x ./kubectl

sudo mv ./kubectl /usr/local/bin/kubectl

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

BASHRC_FILE=/home/oracle/.bashrc

grepresult=$(grep -c "alias json_pp='python -mjson.tool'" $BASHRC_FILE -s)

if [ $grepresult == 1 ]
then
    # bashrc configured for json_pp
    echo "~/.bashrc is already configured for json_pp."
else
    # bashrc not configured for json_pp, need to add
    sudo echo "alias json_pp='python -mjson.tool'" >> $BASHRC_FILE
    echo "~/.bashrc now has been configured for json_pp."
fi

echo "========================================"

GITUPDATE_SHORTCUT=~/Desktop/UpdateDemoGitOnly.desktop

if grep -q "Exec=/u01/content/vmcontrol/control/bin/updateGitOnly.sh" $GITUPDATE_SHORTCUT;
then
    echo "UpdateDemoGitOnly shortcut is ready."
else
    cat > $GITUPDATE_SHORTCUT <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Terminal=true
Icon[en_US]=gnome-panel-launcher
Name[en_US]=Update Demo's Git Only
Exec=/u01/content/vmcontrol/control/bin/updateGitOnly.sh wait
Name=Update Demo's Git Only
Icon=/u01/content/vmcontrol/control/images/git-circle.jpg
EOF
    chmod 755 $GITUPDATE_SHORTCUT
    echo "UpdateDemoGitOnly shortcut has been created."
fi
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

# echo "setup 2019.09.30.========================================"

# remote init to pull OOW 19 configs
bash -c "$(curl -L "https://drive.google.com/uc?export=download&id=1fL6hKVmplp6CEXUursuButCEI7VEzDUX")"

echo "Everything is up to date!"
