#!/bin/bash
#
echo "*******************************************"
echo "Install.... $IAIN"
echo " networkName: $networkName"
echo " hostname:    $hostname"
echo " private_floatingIp: $private_floatingIp "
echo "*******************************************"

sudo apt-get update && sudo apt-get install -y iperf screen