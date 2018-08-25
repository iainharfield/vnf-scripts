#!/bin/bash
#
echo "*******************************************"
echo "Instantiate.... $IAIN"
echo " networkName: $networkName"
echo " hostname:    $hostname"
echo " private_floatingIp: $private_floatingIp "
echo "*******************************************"

sudo apt-get update && sudo apt-get install -y iperf screen
sudo apt-get install -y stress


# Configure /etc/hosts - relises on the script being downloaded, could there be a race condition here? 
sudo ./etchosts.sh add $hostname
sudo ./etchosts.sh add $hostname $private_floatingIp

git clone https://github.com/iainharfield/sb-vnf.git

cp ./sb-vnf/vnfUtil.sh .
sudo chmod +x vnfUtil.sh

