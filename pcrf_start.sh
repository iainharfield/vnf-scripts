#!/bin/bash
echo "*******************************************"
echo "Start.... $IAIN"
echo " networkName: $networkName"
echo " hostname:    $hostname"
echo " private_floatingIp: $private_floatingIp "
echo "*******************************************"

echo 'server_private2='$server_private2 > /home/ubuntu/info

ls /opt/openbaton/scripts/

cp /opt/openbaton/scripts/stresstest.sh ~/
chmod +x ~/stresstest.sh