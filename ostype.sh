#!/bin/bash

#
# return OSNAME type: Mac, CentOS, Ubuntu
# DEMO:  ostype=`sh ostype.sh`
#

# os type detection function
ostype () {
  local OSNAME="`uname`"
  case $OSNAME in
    'Linux')
      OSNAME='Linux'

      cat /etc/*-release | grep -i 'CentOS' > /dev/null
      if [ $? -eq 0 ];
      then
          OSNAME='CentOS'
      else
        cat /etc/*-release | grep -i 'Ubuntu' > /dev/null
        if [ $? -eq 0 ];
        then
          OSNAME='Ubuntu'
        fi
      fi

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

var_osname="$(ostype)"
echo $var_osname
