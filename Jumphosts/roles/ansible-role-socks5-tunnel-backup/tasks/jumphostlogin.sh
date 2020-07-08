#!/bin/bash

re='^[0-9]+$'
if ! [[ $jh1_socks_port =~ $re ]] ; then
    #echo "Socks port is not a number" >&2
    dparam=`echo $jh1_socks_port | sed "s|^socks.*://||" | sed "s|^unixsocket||"`
else
    #dparam=/tmp/mysocks$jh1_socks_port
    dparam=127.0.0.1:$jh1_socks_port
fi

if [ ! -z "$jh5_ip" ]; then
    echo jh5
    ssh -i $jh5_ssh_private_key -o ConnectTimeout=5 -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand="ssh -i $jh4_ssh_private_key -W $jh5_ip:$jh5_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\"ssh -i $jh3_ssh_private_key -W $jh4_ip:$jh4_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\\\"ssh -i $jh2_ssh_private_key -W $jh3_ip:$jh3_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\\\\\\\"ssh -i $jh1_ssh_private_key -W $jh2_ip:$jh2_ssh_port -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh1_ssh_port $jh1_ssh_user@$jh1_ip\\\\\\\" -p $jh2_ssh_port $jh2_ssh_user@$jh2_ip\\\" -p $jh3_ssh_port $jh3_ssh_user@$jh3_ip\" -p $jh4_ssh_port $jh4_ssh_user@$jh4_ip" -p $jh5_ssh_port $jh5_ssh_user@$jh5_ip -fN -D $dparam
elif [ ! -z "$jh4_ip" ]; then
    echo jh4
    ssh -i $jh4_ssh_private_key -o ConnectTimeout=5 -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand="ssh -i $jh3_ssh_private_key -W $jh4_ip:$jh4_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\"ssh -i $jh2_ssh_private_key -W $jh3_ip:$jh3_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\\\"ssh -i $jh1_ssh_private_key -W $jh2_ip:$jh2_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh1_ssh_port $jh1_ssh_user@$jh1_ip\\\" -p $jh2_ssh_port $jh2_ssh_user@$jh2_ip\" -p $jh3_ssh_port $jh3_ssh_user@$jh3_ip" -fN -D $dparam -p $jh4_ssh_port $jh4_ssh_user@$jh4_ip
elif [ ! -z "$jh3_ip" ]; then
    echo jh3
    ssh -i $jh3_ssh_private_key -o ConnectTimeout=5 -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand="ssh -i $jh2_ssh_private_key -W $jh3_ip:$jh3_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\"ssh -i $jh1_ssh_private_key -W $jh2_ip:$jh2_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh1_ssh_port $jh1_ssh_user@$jh1_ip\" -p $jh2_ssh_port $jh2_ssh_user@$jh2_ip" -fN -D $dparam -p $jh3_ssh_port $jh3_ssh_user@$jh3_ip
elif [ ! -z "$jh2_ip" ]; then
    echo jh2
    ssh -i $jh2_ssh_private_key -o ConnectTimeout=5 -oPubkeyAuthentication=yes -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no -oProxyCommand="ssh -i $jh1_ssh_private_key -W $jh2_ip:$jh2_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh1_ssh_port $jh1_ssh_user@$jh1_ip" -fN -D $dparam -p $jh2_ssh_port $jh2_ssh_user@$jh2_ip
elif [ ! -z "$jh1_ip" ]; then
    echo jh1
    ssh -i $jh1_ssh_private_key -o ConnectTimeout=5 -oPubkeyAuthentication=yes -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no -fN -D $dparam -p $jh1_ssh_port $jh1_ssh_user@$jh1_ip
fi
if [ $? -ne 0 ]; then
re='^[0-9]+$'
if ! [[ $bjh1_socks_port =~ $re ]] ; then
    #echo "Socks port is not a number" >&2
    dparam=`echo $bjh1_socks_port | sed "s|^socks.*://||" | sed "s|^unixsocket||"`
else
    #dparam=/tmp/mysocks$bjh1_socks_port
    dparam=127.0.0.1:$bjh1_socks_port
fi
if [ ! -z "$bjh5_ip" ]; then
    echo bjh5
    ssh -i $bjh5_ssh_private_key -o ConnectTimeout=5 -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand="ssh -i $bjh4_ssh_private_key -W $bjh5_ip:$bjh5_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\"ssh -i $bjh3_ssh_private_key -W $bjh4_ip:$bjh4_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\\\"ssh -i $bjh2_ssh_private_key -W $bjh3_ip:$bjh3_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\\\\\\\"ssh -i $bjh1_ssh_private_key -W $bjh2_ip:$bjh2_ssh_port -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $bjh1_ssh_port $bjh1_ssh_user@$bjh1_ip\\\\\\\" -p $bjh2_ssh_port $bjh2_ssh_user@$bjh2_ip\\\" -p $bjh3_ssh_port $bjh3_ssh_user@$bjh3_ip\" -p $bjh4_ssh_port $bjh4_ssh_user@$bjh4_ip" -p $bjh5_ssh_port $bjh5_ssh_user@$bjh5_ip -fN -D $dparam
elif [ ! -z "$bjh4_ip" ]; then
    echo bjh4
    ssh -i $bjh4_ssh_private_key -o ConnectTimeout=5 -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand="ssh -i $bjh3_ssh_private_key -W $bjh4_ip:$bjh4_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\"ssh -i $bjh2_ssh_private_key -W $bjh3_ip:$bjh3_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\\\"ssh -i $bjh1_ssh_private_key -W $bjh2_ip:$bjh2_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $bjh1_ssh_port $bjh1_ssh_user@$bjh1_ip\\\" -p $bjh2_ssh_port $bjh2_ssh_user@$bjh2_ip\" -p $bjh3_ssh_port $bjh3_ssh_user@$bjh3_ip" -fN -D $dparam -p $bjh4_ssh_port $bjh4_ssh_user@$bjh4_ip
elif [ ! -z "$bjh3_ip" ]; then
    echo bjh3
    ssh -i $bjh3_ssh_private_key -o ConnectTimeout=5 -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand="ssh -i $bjh2_ssh_private_key -W $bjh3_ip:$bjh3_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\"ssh -i $bjh1_ssh_private_key -W $bjh2_ip:$bjh2_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $bjh1_ssh_port $bjh1_ssh_user@$bjh1_ip\" -p $bjh2_ssh_port $bjh2_ssh_user@$bjh2_ip" -fN -D $dparam -p $bjh3_ssh_port $bjh3_ssh_user@$bjh3_ip
elif [ ! -z "$bjh2_ip" ]; then
    echo bjh2
    ssh -i $bjh2_ssh_private_key -o ConnectTimeout=5 -oPubkeyAuthentication=yes -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no -oProxyCommand="ssh -i $bjh1_ssh_private_key -W $bjh2_ip:$bjh2_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $bjh1_ssh_port $bjh1_ssh_user@$bjh1_ip" -fN -D $dparam -p $bjh2_ssh_port $bjh2_ssh_user@$bjh2_ip
elif [ ! -z "$bjh1_ip" ]; then
    echo bjh1
    ssh -i $bjh1_ssh_private_key -o ConnectTimeout=5 -oPubkeyAuthentication=yes -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no -fN -D $dparam -p $bjh1_ssh_port $bjh1_ssh_user@$bjh1_ip
fi
fi

sleep 2

# From Linux test login to Target Linux using ncat over the Tunnel
#ssh ec2-user@aakrhel005.yellowykt.com -i ~/amazontestkey.pem -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ProxyCommand="ncat --proxy-type socks5 --proxy 127.0.0.1:1234 %h %p" hostname # /tmp/mysocks$jh1_socks_port %h %p" hostname


# From Mac test login to Target Linux using nc over the Tunnel
# ssh ec2-user@aakrhel005.yellowykt.com -i $endpoint_ssh_private_key -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -vvv -o ProxyCommand="/usr/bin/nc -X 5 -x 127.0.0.1:1234 %h %p" hostname

#echo DONEDONEDONE >&2
echo DONEDONEDONE
