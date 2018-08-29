#!/bin/bash
#
# The image expected to be built with stress application already installed
#
echo "*******************************************"
echo "Instantiate.... $IAIN"
echo " networkName: $networkName"
echo " hostname:    $hostname"
echo " private_floatingIp: $private_floatingIp "
echo "*******************************************"

#This script when launched by OpenBaton runs as root.  Set up SB environment
export STREAMBASE_HOME=/opt/tibco/sb-cep/10.3
export JAVA_HOME=$STREAMBASE_HOME/jdk
export TIBCO_EP_HOME=$STREAMBASE_HOME
export PATH=/opt/tibco/sb-cep/10.3/jdk/bin:/opt/tibco/sb-cep/10.3/bin:/opt/tibco/sb-cep/10.3/distrib/tibco/bin:/opt/tibco/sb-cep/10.3/sdk/mvn/bin:$PATH

# Configure /etc/hosts - relises on the script being downloaded, could there be a race condition here? 
# Throw away error messages on first call to prevent this script from stopping unexpectedly.
sudo /opt/openbaton/scripts/etchosts.sh add $hostname 2> /dev/null
sudo /opt/openbaton/scripts.sh add $hostname $private_floatingIp

# CD to the user home (this script runs as root when launched by openbaton)
cd /home/ubuntu

# Get the demo Streambase Application build
git clone https://github.com/iainharfield/sb-vnf.git

cp ./sb-vnf/vnfUtil.sh .
sudo chmod +x vnfUtil.sh
cp /opt/openbaton/scripts/stresstest.sh .
sudo chmod +x stresstest.sh

# install Streambase VNF Demo (running as root, environment is not right)
epadmin install node --application=./sb-vnf/deploy_nfvDemo-0.0.1-SNAPSHOT-ep-application.zip   --nodename=A.ubuntu --nodedirectory=/home/ubuntu/tmp/Nodedirs 

