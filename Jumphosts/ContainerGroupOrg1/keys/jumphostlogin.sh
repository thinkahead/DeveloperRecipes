#!/bin/bash

echo SSH_AUTH_SOCK=$SSH_AUTH_SOCK
echo SSH_AGENT_PID=$SSH_AGENT_PID
if [ ! -z "$endpoint_ssh_private_key" ]; then
  echo endpoint=${endpoint_ssh_private_key##*/}
  if [ -e "${endpoint_ssh_private_key}" ]; then
    ssh-add ${endpoint_ssh_private_key}
    rm -f ${endpoint_ssh_private_key}
    echo Removed ${endpoint_ssh_private_key}
  fi
fi
if [ ! -z "$jh1_ssh_private_key" ]; then
  echo jh1=${jh1_ssh_private_key##*/}
  if [ -e "${jh1_ssh_private_key}" ]; then
    ssh-add ${jh1_ssh_private_key}
    rm -f ${jh1_ssh_private_key}
    echo Removed ${jh1_ssh_private_key}
  fi
fi
if [ ! -z "$jh2_ssh_private_key" ]; then
  echo jh2=${jh2_ssh_private_key##*/}
  if [ -e "${jh2_ssh_private_key}" ]; then
    ssh-add ${jh2_ssh_private_key}
    rm -f ${jh2_ssh_private_key}
    echo Removed ${jh2_ssh_private_key}
  fi
fi
if [ ! -z "$jh3_ssh_private_key" ]; then
  echo jh3=${jh3_ssh_private_key##*/}
  if [ -e "${jh3_ssh_private_key}" ]; then
    ssh-add ${jh3_ssh_private_key}
    rm -f ${jh3_ssh_private_key}
    echo Removed ${jh3_ssh_private_key}
  fi
fi
if [ ! -z "$jh4_ssh_private_key" ]; then
  echo jh4=${jh4_ssh_private_key##*/}
  if [ -e "${jh4_ssh_private_key}" ]; then
    ssh-add ${jh4_ssh_private_key}
    rm -f ${jh4_ssh_private_key}
    echo Removed ${jh4_ssh_private_key}
  fi
fi
if [ ! -z "$jh5_ssh_private_key" ]; then
  echo jh5=${jh5_ssh_private_key##*/}
  if [ -e "${jh5_ssh_private_key}" ]; then
    ssh-add ${jh5_ssh_private_key}
    rm -f ${jh5_ssh_private_key}
    echo Removed ${jh5_ssh_private_key}
  fi
fi
#ps -ef | grep ssh-agent | grep -v grep
echo DONEDONEDONE
#echo "ssh-add registered with agent:"
#ssh-add -l
