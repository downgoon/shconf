#!/bin/bash

#
# Usage: getprop.sh <key> <conf_file>
# DEMO:  BACKEND_ADDR=`sh getprop.sh backend.service example/app.conf`
#

if [ $# != 2 ]
then
    echo 'Usage: getprop.sh <key> <conf_file>'
    echo "DEMO:  BACKEND_ADDR=\`sh getprop.sh backend.service example/app.conf\`"
    exit -1
fi

TARGET_KEY=$1
CONFIG_FILE=$2

result=`grep "^$TARGET_KEY*=*" $CONFIG_FILE | awk -F '=' '{print $2}'`
result=`echo $result` # trim whitespace
echo $result
