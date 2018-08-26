#!/bin/bash
#
echo "*******************************************"
echo "Instantiate.... $IAIN"
echo " networkName: $networkName"
echo " hostname:    $hostname"
echo " private_floatingIp: $private_floatingIp "
echo "*******************************************"

# Configure /etc/hosts - relises on the script being downloaded, could there be a race condition here? 
# Throw away error messages on first call to prevent this script from stopping.
sudo /opt/openbaton/scripts/etchosts.sh add $hostname 2> /dev/null
sudo /opt/openbaton/scripts.sh add $hostname $private_floatingIp

# install stress application
# sudo apt-get update && sudo apt-get install -y iperf screen
sudo apt-get install -y stress

# CD to the user home (this script runs as root when launched by openbaton)
cd /home/ubuntu

# Get the demo Streambase build
sudo --user=ubuntu git clone https://github.com/iainharfield/sb-vnf.git

cp ./sb-vnf/vnfUtil.sh .
sudo chmod +x vnfUtil.sh

# install Streambase VNF Demo (running as root, environment is not right)
sudo --user=ubuntu install node   --application=./sb-vnf/deploy_nfvDemo-0.0.1-SNAPSHOT-ep-application.zip   --nodename=A.ubuntu --nodedirectory=/home/ubuntu/tmp/Nodedirs 

