#!/bin/bash
#
echo "*******************************************"
echo "Instantiate.... $IAIN"
echo " networkName: $networkName"
echo " hostname:    $hostname"
echo " private_floatingIp: $private_floatingIp "
echo "*******************************************"

sudo apt-get update && sudo apt-get install -y iperf screen
sudo apt-get install -y stress

