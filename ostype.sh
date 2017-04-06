#!/bin/bash

#
# return OSNAME type: Mac, Linux
# DEMO:  ostype=`sh ostype.sh`
#

OSNAMENAME="`uname`"
case $OSNAMENAME in
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
echo $OSNAME
