#!/bin/bash

#usage:
# curl -LSs https://raw.githubusercontent.com/atjapan2015/vmcontrol/scripts/master/bin/install-docker.sh | bash


sudo yum -y remove docker-ce \
	docker-ce-cli

sudo rm -rf /var/lib/docker

sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum -y install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm

sudo yum -y install docker-ce-19.03.3 docker-ce-cli-19.03.3

sudo usermod -a -G docker $USER

sudo systemctl enable docker

sudo systemctl start docker

sudo su - $USER

exit

# DON'T DO IN PRODUCTION. It's ugly solution to use docker without logout/login
sudo chmod 666 /var/run/docker.sock
