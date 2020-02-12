#!/bin/bash

#usage:
# curl -LSs https://raw.githubusercontent.com/atjapan2015/vmcontrol/scripts/master/bin/install-oci.sh | bash

echo "Install OCI CLI"

rm -rf ~/lib/oracle-cli

rm -f ~/oci_install.sh

curl -L https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh --output ~/oci_install.sh

chmod 755 ~/oci_install.sh

~/oci_install.sh --accept-all-defaults

rm -f ~/oci_install.sh

mkdir -p ~/.oci
