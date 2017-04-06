#!/bin/bash

#
# Usage: setprop.sh <key> <value $conf_file>
# DEMO:  sh setprop.sh backend.service 127.0.0.1:10086 example/app.conf
#


if [ $# != 3 ]
then
    echo 'Usage: setprop.sh $key $value $conf_file'
    echo "DEMO:  sh setprop.sh backend.service 127.0.0.1:10086 example/app.conf"
    exit -1
fi
TARGET_KEY=$1
REPLACE_VAL=$2
CONFIG_FILE=$3
#sed -i '' "s/\($TARGET_KEY *= *\).*/\1$REPLACE_VAL/" $CONFIG_FILE # No backup
sed -i '' "s+\($TARGET_KEY *= *\).*+\1$REPLACE_VAL+" $CONFIG_FILE # No backup
