#!/bin/bash

#usage:
# curl -LSs https://raw.githubusercontent.com/nagypeter/vmcontrol/scripts/master/bin/install-java.sh | bash

echo "Install Java..."

sudo yum install -y java-1.8.0-openjdk

BASHRC_FILE=~/.bashrc

grepresult=$(grep -c "export JAVA_HOME" $BASHRC_FILE -s)

if [ $grepresult == 1 ]
then
    # bashrc configured for JAVA_HOME
    echo "~/.bashrc contains JAVA_HOME settings"
else
    # bashrc does not contains JAVA_HOME settings, need to add
    echo 'export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")' >> $BASHRC_FILE
    echo 'export PATH=$PATH:$JAVA_HOME' >> $BASHRC_FILE
    echo "~/.bashrc now contains JAVA_HOME settings"
fi

. ~/.bashrc
