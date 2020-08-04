#!/bin/bash

echo SSH_AUTH_SOCK=$SSH_AUTH_SOCK SSH_AGENT_PID=$SSH_AGENT_PID
if [ ! -z "$endpoint_ssh_private_key" ]; then
  echo endpoint=${endpoint_ssh_private_key##*/}
  if [ -e "${endpoint_ssh_private_key}" ]; then
    ssh-add ${endpoint_ssh_private_key}
    rm -f ${endpoint_ssh_private_key}
    echo Removed ${endpoint_ssh_private_key}
  fi
fi
echo DONEDONEDONE
