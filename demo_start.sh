#!/bin/bash
echo "*******************************************"
echo "Start.... $IAIN"
echo " networkName: $networkName"
echo " hostname:    $hostname"
echo " private_floatingIp: $private_floatingIp "
echo "*******************************************"

#Save floating point IP address for later
echo 'private_floatingIp='$private_floatingIp > /home/ubuntu/info

# ls /opt/openbaton/scripts/

# Start Streambase VNF Demo
epadmin servicename=A.ubuntu start node
