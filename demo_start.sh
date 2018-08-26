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

# install Streambase VNF Demo
epadmin install node   --application=./sb-vnf/deploy_nfvDemo-0.0.1-SNAPSHOT-ep-application.zip   --nodename=A.ubuntu --nodedirectory=/home/ubuntu/tmp/Nodedirs 
epadmin servicename=A.ubuntu stop node
