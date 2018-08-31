#!/bin/bash
echo "*******************************************"
echo "Terminate.... $IAIN"
echo " networkName: $networkName"
echo " hostname:    $hostname"
echo " private_floatingIp: $private_floatingIp "
echo "*******************************************"

# stop Streambase VNF node
epadmin servicename=A.ubuntu stop node
