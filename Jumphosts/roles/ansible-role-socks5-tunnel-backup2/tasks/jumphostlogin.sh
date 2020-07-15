#!/bin/bash

TimeOutjh1=5
TimeOutjh2=10
TimeOutjh3=15
TimeOutjh4=20
TimeOutjh5=25

re='^[0-9]+$'
if ! [[ $jh1_socks_port =~ $re ]] ; then
    #echo "Socks port is not a number" >&2
    dparam=`echo $jh1_socks_port | sed "s|^socks.*://||" | sed "s|^unixsocket||"`
else
    #dparam=/tmp/mysocks$jh1_socks_port
    dparam=127.0.0.1:$jh1_socks_port
fi

echo "$jh1_ip -> $jh2_ip -> $jh3_ip -> $jh4_ip -> $jh5_ip"
for jh1ip in $(echo $jh1_ip | sed "s/,/ /g"); do
  echo "Hop Testing $jh1ip"
  ssh -o ConnectTimeout=$TimeOutjh1 -i $jh1_ssh_private_key -oPubkeyAuthentication=yes -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no -p $jh1_ssh_port $jh1_ssh_user@$jh1ip -q exit
  retcode=$?
  echo "Hop Tested $jh1ip $retcode"
  if [ $retcode -ne 0 ]; then continue; fi

  if [ -z "$jh2_ip" ]; then
    echo "Using $jh1ip"
    ssh -o ConnectTimeout=$TimeOutjh1 -i $jh1_ssh_private_key -oPubkeyAuthentication=yes -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no -fN -D $dparam -p $jh1_ssh_port $jh1_ssh_user@$jh1ip
    if [ $? -ne 0 ]; then pid=`ps -ef | grep ssh | grep "$dparam" | grep -v grep | awk '{print $2}'`; if [ ! -z "$pid" ]; then echo kill $pid; kill $pid; fi; else echo "Hops1 BREAK";break; fi
  else
    for jh2ip in $(echo $jh2_ip | sed "s/,/ /g"); do
      echo "Hop Testing $jh1ip -> $jh2ip"
      ssh -o ConnectTimeout=$TimeOutjh2 -i $jh2_ssh_private_key -oPubkeyAuthentication=yes -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no -oProxyCommand="ssh -i $jh1_ssh_private_key -W $jh2ip:$jh2_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh1_ssh_port $jh1_ssh_user@$jh1ip" -p $jh2_ssh_port $jh2_ssh_user@$jh2ip -q exit
      retcode=$?
      echo "Hop Tested $jh1ip -> $jh2ip $retcode"
      if [ $retcode -ne 0 ]; then continue; fi

      if [ -z "$jh3_ip" ]; then
        echo "Using $jh1ip -> $jh2ip"
        ssh -o ConnectTimeout=$TimeOutjh2 -i $jh2_ssh_private_key -oPubkeyAuthentication=yes -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no -oProxyCommand="ssh -i $jh1_ssh_private_key -W $jh2ip:$jh2_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh1_ssh_port $jh1_ssh_user@$jh1ip" -fN -D $dparam -p $jh2_ssh_port $jh2_ssh_user@$jh2ip
        if [ $? -ne 0 ]; then pid=`ps -ef | grep ssh | grep "$dparam" | grep -v grep | awk '{print $2}'`; if [ ! -z "$pid" ]; then echo kill $pid; kill $pid; fi; else echo "Hops2 BREAK";break 2; fi
      else
        for jh3ip in $(echo $jh3_ip | sed "s/,/ /g"); do
          echo "Hop Testing $jh1ip -> $jh2ip -> $jh3ip"
          ssh -o ConnectTimeout=$TimeOutjh3 -i $jh3_ssh_private_key -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand="ssh -i $jh2_ssh_private_key -W $jh3ip:$jh3_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\"ssh -i $jh1_ssh_private_key -W $jh2ip:$jh2_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh1_ssh_port $jh1_ssh_user@$jh1ip\" -p $jh2_ssh_port $jh2_ssh_user@$jh2ip" -p $jh3_ssh_port $jh3_ssh_user@$jh3ip -q exit
          retcode=$?
          echo "Hop Tested $jh1ip -> $jh2ip -> $jh3ip $retcode"
          if [ $retcode -ne 0 ]; then continue; fi

          if [ -z "$jh4_ip" ]; then
            echo "Using $jh1ip -> $jh2ip -> $jh3ip"
            ssh -o ConnectTimeout=$TimeOutjh3 -i $jh3_ssh_private_key -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand="ssh -i $jh2_ssh_private_key -W $jh3ip:$jh3_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\"ssh -i $jh1_ssh_private_key -W $jh2ip:$jh2_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh1_ssh_port $jh1_ssh_user@$jh1ip\" -p $jh2_ssh_port $jh2_ssh_user@$jh2ip" -fN -D $dparam -p $jh3_ssh_port $jh3_ssh_user@$jh3ip
            if [ $? -ne 0 ]; then pid=`ps -ef | grep ssh | grep "$dparam" | grep -v grep | awk '{print $2}'`; if [ ! -z "$pid" ]; then echo kill $pid; kill $pid; fi; else echo "Hops3 BREAK";break 3; fi
          else
            for jh4ip in $(echo $jh4_ip | sed "s/,/ /g"); do
              echo "Hop Testing $jh1ip -> $jh2ip -> $jh3ip -> $jh4ip"
              ssh -o ConnectTimeout=$TimeOutjh4 -i $jh4_ssh_private_key -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand="ssh -i $jh3_ssh_private_key -W $jh4ip:$jh4_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\"ssh -i $jh2_ssh_private_key -W $jh3ip:$jh3_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\\\"ssh -i $jh1_ssh_private_key -W $jh2ip:$jh2_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh1_ssh_port $jh1_ssh_user@$jh1ip\\\" -p $jh2_ssh_port $jh2_ssh_user@$jh2ip\" -p $jh3_ssh_port $jh3_ssh_user@$jh3ip" -p $jh4_ssh_port $jh4_ssh_user@$jh4ip -q exit
              retcode=$?
              echo "Hop Tested $jh1ip -> $jh2ip -> $jh3ip -> $jh4ip $retcode"
              if [ $retcode -ne 0 ]; then continue; fi

              if [ -z "$jh5_ip" ]; then
                echo "Using $jh1ip -> $jh2ip -> $jh3ip -> $jh4ip"
                ssh -o ConnectTimeout=$TimeOutjh4 -i $jh4_ssh_private_key -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand="ssh -i $jh3_ssh_private_key -W $jh4ip:$jh4_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\"ssh -i $jh2_ssh_private_key -W $jh3ip:$jh3_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\\\"ssh -i $jh1_ssh_private_key -W $jh2ip:$jh2_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh1_ssh_port $jh1_ssh_user@$jh1ip\\\" -p $jh2_ssh_port $jh2_ssh_user@$jh2ip\" -p $jh3_ssh_port $jh3_ssh_user@$jh3ip" -fN -D $dparam -p $jh4_ssh_port $jh4_ssh_user@$jh4ip
                if [ $? -ne 0 ]; then pid=`ps -ef | grep ssh | grep "$dparam" | grep -v grep | awk '{print $2}'`; if [ ! -z "$pid" ]; then echo kill $pid; kill $pid; fi; else echo "Hops4 BREAK";break 4; fi
              else
                for jh5ip in $(echo $jh5_ip | sed "s/,/ /g"); do
                  echo "Using $jh1ip -> $jh2ip -> $jh3ip -> $jh4ip -> $jh5ip"
                  ssh -o ConnectTimeout=$TimeOutjh5 -i $jh5_ssh_private_key -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand="ssh -i $jh4_ssh_private_key -W $jh5ip:$jh5_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\"ssh -i $jh3_ssh_private_key -W $jh4ip:$jh4_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\\\"ssh -i $jh2_ssh_private_key -W $jh3ip:$jh3_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\\\\\\\"ssh -i $jh1_ssh_private_key -W $jh2ip:$jh2_ssh_port -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh1_ssh_port $jh1_ssh_user@$jh1ip\\\\\\\" -p $jh2_ssh_port $jh2_ssh_user@$jh2ip\\\" -p $jh3_ssh_port $jh3_ssh_user@$jh3ip\" -p $jh4_ssh_port $jh4_ssh_user@$jh4ip" -p $jh5_ssh_port $jh5_ssh_user@$jh5ip -fN -D $dparam
                  if [ $? -ne 0 ]; then pid=`ps -ef | grep ssh | grep "$dparam" | grep -v grep | awk '{print $2}'`; if [ ! -z "$pid" ]; then echo kill $pid; kill $pid; fi; else echo "Hops5 BREAK";break 5; fi
                done
              fi
            done
          fi
        done
      fi
    done
  fi
done

sleep 2

# From Linux test login to Target Linux using ncat over the Tunnel
#ssh ec2-user@aakrhel005.yellowykt.com -i ~/amazontestkey.pem -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ProxyCommand="ncat --proxy-type socks5 --proxy 127.0.0.1:1234 %h %p" hostname # /tmp/mysocks$jh1_socks_port %h %p" hostname


# From Mac test login to Target Linux using nc over the Tunnel
# ssh ec2-user@aakrhel005.yellowykt.com -i $endpoint_ssh_private_key -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -vvv -o ProxyCommand="/usr/bin/nc -X 5 -x 127.0.0.1:1234 %h %p" hostname

#echo DONEDONEDONE >&2
echo DONEDONEDONE
