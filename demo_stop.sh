#!/bin/bash
echo "*******************************************"
echo "* Stop...."                         
echo "* Description : $Description"
echo "* mqttBroker = $mqttBroker"
echo "* mqttPublishDelay = $mqttPublishDelay"
echo "* mqttQueueName = $mqttQueueName"
echo "* networkName: $networkName"
echo "* hostname:    $hostname"
echo "* private_floatingIp: $private_floatingIp"
echo "*******************************************"
export STREAMBASE_HOME=/opt/tibco/sb-cep/10.3
export JAVA_HOME=$STREAMBASE_HOME/jdk
export TIBCO_EP_HOME=$STREAMBASE_HOME
export PATH=/opt/tibco/sb-cep/10.3/jdk/bin:/opt/tibco/sb-cep/10.3/bin:/opt/tibco/sb-cep/10.3/distrib/tibco/bin:/opt/tibco/sb-cep/10.3/sdk/mvn/bin:$PATH

CLUSTER_NAME=vnfdemo

# stop Streambase VNF node
epadmin servicename=${CLUSTER_NAME} stop node
