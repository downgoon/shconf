#!/bin/bash

#
# Usage: replaceby.sh <refer_file> <conf_file> [debug]
# DEMO: replaceby.sh example/nginx.conf example/app.conf [debug]
# <conf_file> demo:
#   host=192.168.1.100
#   port = 8080
# <refer_file> demo:
#   server {
#       listen ${host}:${port}
#  }
#

if [ $# -lt 2 ]
then
    echo 'Usage: replaceby.sh <refer_file> <conf_file>'
    echo "DEMO: replaceby.sh example/nginx.conf example/app.conf"
    exit -1
fi

REFER_FILE=$1
CONFIG_FILE=$2

isDebug="false"
if [ $# -ge 3 -a "$3" = "debug" ]
then
  isDebug="true"
fi


while read LINE
do
  if echo $LINE | grep -v '^#' | grep '=' > /dev/null ; then
    # is conf item line (skip commented lines)
    conf_key=`echo $LINE | awk -F '=' '{print $1}'`
    conf_key=$(echo $conf_key)  # trim whitespace
    conf_val=`echo $LINE | awk -F '=' '{print $2}' | awk -F '#' '{print $1}' `
    conf_val=$(echo $conf_val)  # trim whitespace

    if [ $isDebug = "true" ]; then
        echo \'$conf_key\': \'$conf_val\'  # debuging
    fi

    # on Mac:  cmd without backup is "sed -i ''"
    # on Ubuntu: cmd without backup is "sed -i"
    sed -i.backup  "s+[$][{]$conf_key[}]+$conf_val+g" $REFER_FILE # backup before modifying

  else
    if [ $isDebug = "true" ]; then
        echo '    skip non-conf line: '$LINE   # debuging > /dev/null
    fi
  fi

done < $CONFIG_FILE
