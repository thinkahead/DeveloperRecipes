#eval `ssh-agent -s`
eval $(ssh-agent -s | tee /root/ssh-agent.env)
#export jh1_socks_port=socks5h://unixsocket/tmp/mysock.sock
export jh1_socks_port=socks5h://127.0.0.1:1234
#export jh1_socks_port=$1
export endpoint_ssh_private_key=/root/keys/alexei-key-ecdsa-aakrhel005
export endpoint_ssh_private_key_passphrase=Passphrase4aakrhel005
export endpoint_ip=aakrhel005.yellowykt.com
export endpoint_ssh_port=22
export endpoint_ssh_user=ec2-user
export jh5_ssh_private_key=/root/keys/alexei-key-ecdsa-aakrhel006
export jh5_ssh_private_key_passphrase=Passphrase4aakrhel006
export jh5_ip=aakrhel006.yellowykt.com
export jh5_ssh_port=22
export jh5_ssh_user=ec2-user
export jh4_ssh_private_key=/root/keys/alexei-key-ecdsa-aakrhel003
export jh4_ssh_private_key_passphrase=Passphrase4aakrhel003
export jh4_ip=aakrhel003.yellowykt.com
export jh4_ssh_port=22
export jh4_ssh_user=ec2-user
export jh3_ssh_private_key=/root/keys/alexei-key-ecdsa-aakrhel002
export jh3_ssh_private_key_passphrase=Passphrase4aakrhel002
export jh3_ip=aakrhel002.yellowykt.com
export jh3_ssh_port=22
export jh3_ssh_user=ec2-user
export jh2_ssh_private_key=/root/keys/alexei-key-ecdsa-aakrhel001
export jh2_ssh_private_key_passphrase=Passphrase4aakrhel001
export jh2_ip=aakrhel001.yellowykt.com
export jh2_ssh_port=22
export jh2_ssh_user=ec2-user
export jh1_ssh_private_key=/root/keys/alexei-key-ecdsa-jumphost
export jh1_ssh_private_key_passphrase=Passphrase4ec2
export jh1_ip=ec2-52-201-237-93.compute-1.amazonaws.com
export jh1_ssh_port=22
export jh1_ssh_user=ec2-user
/root/keys/login_with_expect.sh

re='^[0-9]+$'
if ! [[ $jh1_socks_port =~ $re ]] ; then
    #echo "Socks port is not a number" >&2
    dparam=`echo $jh1_socks_port | sed "s|^socks.*://||" | sed "s|^unixsocket||"`
else
    #dparam=/tmp/mysocks$jh1_socks_port
    dparam=127.0.0.1:$jh1_socks_port
fi

if [ ! -z "$jh5_ip" ]; then
    ssh -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand="ssh -W $jh5_ip:$jh5_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\"ssh -W $jh4_ip:$jh4_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\\\"ssh -W $jh3_ip:$jh3_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\\\\\\\"ssh -W $jh2_ip:$jh2_ssh_port -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh1_ssh_port $jh1_ssh_user@$jh1_ip\\\\\\\" -p $jh2_ssh_port $jh2_ssh_user@$jh2_ip\\\" -p $jh3_ssh_port $jh3_ssh_user@$jh3_ip\" -p $jh4_ssh_port $jh4_ssh_user@$jh4_ip" -p $jh5_ssh_port $jh5_ssh_user@$jh5_ip -fN -D $dparam
elif [ ! -z "$jh4_ip" ]; then
    ssh -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand="ssh -W $jh4_ip:$jh4_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\"ssh -W $jh3_ip:$jh3_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\\\"ssh -W $jh2_ip:$jh2_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh1_ssh_port $jh1_ssh_user@$jh1_ip\\\" -p $jh2_ssh_port $jh2_ssh_user@$jh2_ip\" -p $jh3_ssh_port $jh3_ssh_user@$jh3_ip" -fN -D $dparam -p $jh4_ssh_port $jh4_ssh_user@$jh4_ip
elif [ ! -z "$jh3_ip" ]; then
    ssh -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand="ssh -W $jh3_ip:$jh3_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oProxyCommand=\"ssh -W $jh2_ip:$jh2_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh1_ssh_port $jh1_ssh_user@$jh1_ip\" -p $jh2_ssh_port $jh2_ssh_user@$jh2_ip" -fN -D $dparam -p $jh3_ssh_port $jh3_ssh_user@$jh3_ip
elif [ ! -z "$jh2_ip" ]; then
    echo ssh -oPubkeyAuthentication=yes -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no -oProxyCommand=\"ssh -W $jh2_ip:$jh2_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh1_ssh_port $jh1_ssh_user@$jh1_ip\" -fN -D $dparam -p $jh2_ssh_port $jh2_ssh_user@$jh2_ip
    ssh -oPubkeyAuthentication=yes -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no -oProxyCommand="ssh -W $jh2_ip:$jh2_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh1_ssh_port $jh1_ssh_user@$jh1_ip" -fN -D $dparam -p $jh2_ssh_port $jh2_ssh_user@$jh2_ip
elif [ ! -z "$jh1_ip" ]; then
    echo ssh -oPubkeyAuthentication=yes -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no -fN -D $dparam -p $jh1_ssh_port $jh1_ssh_user@$jh1_ip
    ssh -oPubkeyAuthentication=yes -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no -fN -D $dparam -p $jh1_ssh_port $jh1_ssh_user@$jh1_ip
fi

sleep infinity
