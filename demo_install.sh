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

# Get the demo Streambase build
git clone https:/github.com/iainharfield/sb-vnf.git

cp ./sb-vnf/vnfUtil.sh .
sudo chmod +x vnfUtil.sh

# install Streambase VNF Demo
epadmin install node   --application=./sb-vnf/deploy_nfvDemo-0.0.1-SNAPSHOT-ep-application.zip   --nodename=A.ubuntu --nodedirectory=/home/ubuntu/tmp/Nodedirs 

