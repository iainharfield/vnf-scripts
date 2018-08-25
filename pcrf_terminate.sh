#!/bin/bash
echo "*******************************************"
echo "Terminate.... $IAIN"
echo " networkName: $networkName"
echo " hostname:    $hostname"
echo " private_floatingIp: $private_floatingIp "
echo "*******************************************"

echo 'server_private2='$server_private2 > /home/ubuntu/info

# stop Streambase VNF node
epadmin servicename=A.ubuntu stop node

# remove the node
epadmin servicename=A.ubuntu remove node
