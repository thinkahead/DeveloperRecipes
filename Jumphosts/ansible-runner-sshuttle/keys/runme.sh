eval $(ssh-agent -s | tee /root/ssh-agent.env)
proxied_ip_addresses=$@

export endpoint_ssh_private_key="uninitialized_endpoint"
export endpoint_ssh_private_key_passphrase=""
export endpoint_ip=""
export endpoint_ssh_port=""
export endpoint_ssh_user=""
#export endpoint_ssh_private_key=/root/keys/alexei-key-ecdsa-aakrhel005
#export endpoint_ssh_private_key_passphrase=Passphrase4aakrhel005
#export endpoint_ip=aakrhel005.yellowykt.com
#export endpoint_ssh_port=22
#export endpoint_ssh_user=ec2-user

export jh5_ssh_private_key="uninitialized_jh5"
export jh5_ssh_private_key_passphrase=""
export jh5_ip=""
export jh5_ssh_port=""
export jh5_ssh_user=""
#export jh5_ssh_private_key=/root/keys/alexei-key-ecdsa-aakrhel006
#export jh5_ssh_private_key_passphrase=Passphrase4aakrhel006
#export jh5_ip=aakrhel006.yellowykt.com
#export jh5_ssh_port=22
#export jh5_ssh_user=ec2-user

#export jh4_ssh_private_key="uninitialized_jh4"
#export jh4_ssh_private_key_passphrase=""
#export jh4_ip=""
#export jh4_ssh_port=""
#export jh4_ssh_user=""
export jh4_ssh_private_key=/root/keys/alexei-key-ecdsa-aakrhel003
export jh4_ssh_private_key_passphrase=Passphrase4aakrhel003
export jh4_ip=aakrhel003.yellowykt.com
export jh4_ssh_port=22
export jh4_ssh_user=ec2-user

#export jh3_ssh_private_key="uninitialized_jh3"
#export jh3_ssh_private_key_passphrase=""
#export jh3_ip=""
#export jh3_ssh_port=""
#export jh3_ssh_user=""
export jh3_ssh_private_key=/root/keys/alexei-key-ecdsa-aakrhel002
export jh3_ssh_private_key_passphrase=Passphrase4aakrhel002
export jh3_ip=aakrhel002.yellowykt.com
export jh3_ssh_port=22
export jh3_ssh_user=ec2-user

#export jh2_ssh_private_key="uninitialized_jh2"
#export jh2_ssh_private_key_passphrase=""
#export jh2_ip=""
#export jh2_ssh_port=""
#export jh2_ssh_user=""
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

if [ ! -z "$jh5_ip" ]; then
    /var/lib/awx/venv/ansible/bin/sshuttle --python=/usr/bin/python3 -D --dns --no-latency-control -vvv -r $jh5_ssh_user@$jh5_ip --ssh-cmd "ssh -p $jh5_ssh_port -oPubkeyAuthentication=yes -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no -o ProxyCommand=\"ssh -W %h:%p -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh4_ssh_port $jh4_ssh_user@$jh4_ip -o ProxyCommand=\\\"ssh -W $jh4_ip:$jh4_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh3_ssh_port $jh3_ssh_user@$jh3_ip -oProxyCommand=\\\\\\\"ssh -W $jh3_ip:$jh3_ssh_port -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh2_ssh_port $jh2_ssh_user@$jh2_ipi -oProxyCommand=\\\\\\\\\\\\\\\"ssh -i $jh1_ssh_private_key -W $jh2_ip:$jh2_ssh_port -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh1_ssh_port $jh1_ssh_user@$jh1_ip\\\\\\\\\\\\\\\"\\\\\\\"\\\"\"" $@
elif [ ! -z "$jh4_ip" ]; then
    /var/lib/awx/venv/ansible/bin/sshuttle --python=/usr/bin/python3 -D --dns --no-latency-control -vvv -r $jh4_ssh_user@$jh4_ip --ssh-cmd "ssh -p $jh4_ssh_port -oPubkeyAuthentication=yes -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no -o ProxyCommand=\"ssh -W %h:%p -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh3_ssh_port $jh3_ssh_user@$jh3_ip -o ProxyCommand=\\\"ssh -W $jh3_ip:$jh3_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh2_ssh_port $jh2_ssh_user@$jh2_ip -oProxyCommand=\\\\\\\"ssh -W $jh2_ip:$jh2_ssh_port -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh1_ssh_port $jh1_ssh_user@$jh1_ip\\\\\\\"\\\"\"" $@
elif [ ! -z "$jh3_ip" ]; then
    echo /var/lib/awx/venv/ansible/bin/sshuttle --python=/usr/bin/python3 -D --dns --no-latency-control -vvv -r $jh3_ssh_user@$jh3_ip --ssh-cmd \"ssh -p $jh3_ssh_port -oPubkeyAuthentication=yes -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no -o ProxyCommand=\\\"ssh -W %h:%p -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh2_ssh_port $jh2_ssh_user@$jh2_ip -o ProxyCommand=\\\\\\\"ssh -W $jh2_ip:$jh2_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh1_ssh_port $jh1_ssh_user@$jh1_ip\\\\\\\"\\\"\"
    /var/lib/awx/venv/ansible/bin/sshuttle --python=/usr/bin/python3 -D --dns --no-latency-control -vvv -r $jh3_ssh_user@$jh3_ip --ssh-cmd "ssh -p $jh3_ssh_port -oPubkeyAuthentication=yes -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no -o ProxyCommand=\"ssh -W %h:%p -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh2_ssh_port $jh2_ssh_user@$jh2_ip -o ProxyCommand=\\\"ssh -W $jh2_ip:$jh2_ssh_port -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh1_ssh_port $jh1_ssh_user@$jh1_ip\\\"\"" $@
elif [ ! -z "$jh2_ip" ]; then
    echo /var/lib/awx/venv/ansible/bin/sshuttle --python=/usr/bin/python3 -D --dns --no-latency-control -vvv -r $jh2_ssh_user@$jh2_ip --ssh-cmd \"ssh -p $jh2_ssh_port -oPubkeyAuthentication=yes -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no -oProxyCommand=\\\"ssh -W %h:%p -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh1_ssh_port $jh1_ssh_user@$jh1_ip\\\"\"
    /var/lib/awx/venv/ansible/bin/sshuttle --python=/usr/bin/python3 -D --dns --no-latency-control -vvv -r $jh2_ssh_user@$jh2_ip --ssh-cmd "ssh -p $jh2_ssh_port -oPubkeyAuthentication=yes -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no -oProxyCommand=\"ssh -W %h:%p -oPubkeyAuthentication=yes -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p $jh1_ssh_port $jh1_ssh_user@$jh1_ip\"" $@
elif [ ! -z "$jh1_ip" ]; then
    echo /var/lib/awx/venv/ansible/bin/sshuttle --python=/usr/bin/python3 -D --dns --no-latency-control -vvv -r $jh1_ssh_user@$jh1_ip --ssh-cmd \"ssh -p $jh1_ssh_port -oPubkeyAuthentication=yes -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no\"
    /var/lib/awx/venv/ansible/bin/sshuttle --python=/usr/bin/python3 -D --dns --no-latency-control -vvv -r $jh1_ssh_user@$jh1_ip --ssh-cmd "ssh -p $jh1_ssh_port -oPubkeyAuthentication=yes -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no" $@
fi
sleep infinity
