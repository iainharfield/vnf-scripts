#!/bin/bash
echo "*******************************************"
echo "  Start....                               *"
echo "* Description : $Description              *"
echo "* mqttBroker = $mqttBroker                *"
echo "* mqttPublishDelay = $mqttPublishDelay    *"
echo "* networkName: $networkName"
echo "* hostname:    $hostname"
echo "* private_floatingIp: $private_floatingIp "
echo "*******************************************"

#Save floating point IP address for later
echo 'private_floatingIp='$private_floatingIp > /home/ubuntu/info

CLUSTER_NAME=$(hostname)

# Start Streambase VNF Demo
epadmin servicename=${CLUSTER_NAME} start node
