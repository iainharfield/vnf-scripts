#!/bin/bash
echo "*******************************************"
echo "Terminate.... $IAIN"
echo " networkName: $networkName"
echo " hostname:    $hostname"
echo " private_floatingIp: $private_floatingIp "
echo "*******************************************"

CLUSTER_NAME=$(hostname)

# stop Streambase VNF node
epadmin servicename=${CLUSTER_NAME} stop node
