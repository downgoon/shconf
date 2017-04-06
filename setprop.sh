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


# on Mac
# sed -i '' "s+\($TARGET_KEY *= *\).*+\1$REPLACE_VAL+" $CONFIG_FILE # No backup

# on Linux
# sed -i "s+\($TARGET_KEY *= *\).*+\1$REPLACE_VAL+" $CONFIG_FILE # No backup

# fuction "ostype" return Mac, Linux and so on
# function ostype () { ... }: NOT SUPPORTED ON Ubuntu
ostype () {
  local OSNAME="`uname`"
  case $OSNAME in
    'Linux')
      OSNAME='Linux'
      alias ls='ls --color=auto'
      ;;
    'FreeBSD')
      OSNAME='FreeBSD'
      alias ls='ls -G'
      ;;
    'WindowsNT')
      OSNAME='Windows'
      ;;
    'Darwin')
      OSNAME='Mac'
      ;;
    'SunOSNAME')
      OSNAME='Solaris'
      ;;
    'AIX') ;;
    *) ;;
  esac
  echo  "$OSNAME"
}

#
# do replacement
#
osname="$(ostype)"  # get ostype by calling function


if [ $osname = "Mac" ]; then
  sed -i '' "s+\($TARGET_KEY *= *\).*+\1$REPLACE_VAL+" $CONFIG_FILE
else
  sed -i "s+\($TARGET_KEY *= *\).*+\1$REPLACE_VAL+" $CONFIG_FILE
fi
