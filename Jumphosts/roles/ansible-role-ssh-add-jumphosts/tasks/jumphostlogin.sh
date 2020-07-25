#!/bin/bash

#eval `ssh-agent -s -t 20` # Don't start new agent here
#eval `ssh-agent -s` # Don't start new agent here
echo SSH_AUTH_SOCK=$SSH_AUTH_SOCK
echo SSH_AGENT_PID=$SSH_AGENT_PID
if [ ! -z "$endpoint_ssh_private_key_passphrase" ]; then
  echo endpoint=${endpoint_ssh_private_key##*/}
  ssh-add ${endpoint_ssh_private_key}
  rm -f ${endpoint_ssh_private_key}
fi
if [ ! -z "$jh1_ssh_private_key_passphrase" ]; then
  echo jh1=${jh1_ssh_private_key##*/}
  ssh-add ${jh1_ssh_private_key}
  rm -f ${jh1_ssh_private_key}
fi
if [ ! -z "$jh2_ssh_private_key_passphrase" ]; then
  echo jh2=${jh2_ssh_private_key##*/}
  ssh-add ${jh2_ssh_private_key}
  rm -f ${jh2_ssh_private_key}
fi
if [ ! -z "$jh3_ssh_private_key_passphrase" ]; then
  echo jh3=${jh3_ssh_private_key##*/}
  ssh-add ${jh3_ssh_private_key}
  rm -f ${jh3_ssh_private_key}
fi
if [ ! -z "$jh4_ssh_private_key_passphrase" ]; then
  echo jh4=${jh4_ssh_private_key##*/}
  ssh-add ${jh4_ssh_private_key}
  rm -f ${jh4_ssh_private_key}
fi
if [ ! -z "$jh5_ssh_private_key_passphrase" ]; then
  echo jh5=${jh5_ssh_private_key##*/}
  ssh-add ${jh5_ssh_private_key}
  rm -f ${jh5_ssh_private_key}
fi
#ps -ef | grep ssh-agent | grep -v grep
echo DONEDONEDONE
#echo "ssh-add registered with agent:"
#ssh-add -l
