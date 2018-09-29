#!/bin/bash
echo "*******************************************"
echo "* Terminate....                           *"
echo "* Description : $Description              *"
echo "* mqttBroker = $mqttBroker                *"
echo "* mqttPublishDelay = $mqttPublishDelay    *"
echo "* networkName: $networkName"
echo "* hostname:    $hostname"
echo "* private_floatingIp: $private_floatingIp "
echo "*******************************************"
CLUSTER_NAME=$(hostname)

# stop Streambase VNF node
epadmin servicename=${CLUSTER_NAME} stop node

# remove the node
epadmin servicename=${CLUSTER_NAME} remove node
