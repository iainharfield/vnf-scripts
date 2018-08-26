#!/bin/bash
echo "*******************************************"
echo "Start.... $IAIN"
echo " networkName: $networkName"
echo " hostname:    $hostname"
echo " private_floatingIp: $private_floatingIp "
echo "*******************************************"

echo 'private_floatingIp='$private_floatingIp > /home/ubuntu/info

ls /opt/openbaton/scripts/

cp /opt/openbaton/scripts/stresstest.sh /home/ubuntu/
chmod +x /home/ubuntu/stresstest.sh

# Start Streambase VNF Demo
epadmin servicename=A.ubuntu stop node
