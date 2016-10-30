#!/bin/bash
#
echo "*******************************************"
echo "Initiate.... $IAIN"
echo " networkName: $networkName"
echo " hostname:    $hostname"
echo " private_floatingIp: $private_floatingIp "
echo "*******************************************"

sudo apt-get update && sudo apt-get install -y iperf screen
sudo apt-get install -y stress

sudo cp stresstest ~/
sudo chmod +x stresstest