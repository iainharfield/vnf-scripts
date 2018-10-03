#!/bin/bash
#
# The image expected to be built with stress application already installed
#
echo "*******************************************"
echo "* Instantiate...."                         
echo "* Description : $Description"
echo "* mqttBroker = $mqttBroker"
echo "* mqttPublishDelay = $mqttPublishDelay"
echo "* mqttQueueName = $mqttQueueName"
echo "* networkName: $networkName"
echo "* hostname:    $hostname"
echo "* private_floatingIp: $private_floatingIp"
echo "*******************************************"

#This script when launched by OpenBaton runs as root.  Set up SB environment
export STREAMBASE_HOME=/opt/tibco/sb-cep/10.3
export JAVA_HOME=$STREAMBASE_HOME/jdk
export TIBCO_EP_HOME=$STREAMBASE_HOME
export PATH=/opt/tibco/sb-cep/10.3/jdk/bin:/opt/tibco/sb-cep/10.3/bin:/opt/tibco/sb-cep/10.3/distrib/tibco/bin:/opt/tibco/sb-cep/10.3/sdk/mvn/bin:$PATH

# Configure /etc/hosts - relies on the script being downloaded, could there be a race condition here? 
# Throw away error messages on first call to prevent this script from stopping unexpectedly.
sudo /opt/openbaton/scripts/etchosts.sh add $hostname 2> /dev/null
sudo /opt/openbaton/scripts.sh add $hostname $private_floatingIp

# CD to the user home (this script runs as root when launched by openbaton)
cd /home/ubuntu

# Get the demo Streambase Application build
git clone https://github.com/iainharfield/sbVNFdemoApp.git

APPLICATION=$(pwd)/sbVNFdemoApp/app/vnfDemo_Deploy-0.0.1-SNAPSHOT-ep-application.zip
CLUSTER_NAME=vnfdemo
NODE_NAME=$(hostname)
NODE_DIR=$(pwd)/vnfnodes

cp ./sbVNFdemoApp/vnfUtil.sh .
sudo chmod +x vnfUtil.sh
cp /opt/openbaton/scripts/stresstest.sh .
sudo chmod +x stresstest.sh

epadmin install node \
                description="SB10-VNF" \
		nodename=${NODE_NAME}.${CLUSTER_NAME} \
		application=$APPLICATION \
		nodedirectory=$NODE_DIR \
		substitutions="VNFNODE=${CLUSTER_NAME}.NODE_CLIENT_PORT=10000,METRONOME_INTERVAL=${mqttPublishDelay},MQTT_BROKER=${mqttBroker}" \
		nodedeploy=$(pwd)/sbVNFdemoApp/configurations/node.conf

