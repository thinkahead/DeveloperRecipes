#export jh1_socks_port=socks5h://unixsocket/tmp/mysock.sock
export jh1_socks_port=socks5h://127.0.0.1:1234
export endpoint_ssh_private_key=/Users/karve/Downloads/expecttest/alexei-key-ecdsa-aakrhel005
export endpoint_ssh_private_key_passphrase=watson914aakrhel005
export jh5_ssh_private_key=/Users/karve/Downloads/expecttest/alexei-key-ecdsa-aakrhel006
export jh5_ssh_private_key_passphrase=watson914aakrhel006
export jh5_ip=aakrhel006.yellowykt.com
export jh5_ssh_port=22
export jh5_ssh_user=ec2-user
export jh4_ssh_private_key=/Users/karve/Downloads/expecttest/alexei-key-ecdsa-aakrhel003
export jh4_ssh_private_key_passphrase=watson914aakrhel003
export jh4_ip=aakrhel003.yellowykt.com
export jh4_ssh_port=22
export jh4_ssh_user=ec2-user
export jh3_ssh_private_key=/Users/karve/Downloads/expecttest/alexei-key-ecdsa-aakrhel002
export jh3_ssh_private_key_passphrase=watson914aakrhel002
export jh3_ip=aakrhel002,aakrhel002.yellowykt.com
export jh3_ssh_port=22
export jh3_ssh_user=ec2-user
export jh2_ssh_private_key=/Users/karve/Downloads/expecttest/alexei-key-ecdsa-aakrhel001
export jh2_ssh_private_key_passphrase=watson914aakrhel001
export jh2_ip=aakrhel001.yellowykt.com
export jh2_ssh_port=22
export jh2_ssh_user=ec2-user
export jh1_ssh_private_key=/Users/karve/Downloads/expecttest/alexei-key-ecdsa-jumphost
export jh1_ssh_private_key_passphrase=watson914
export jh1_ip=ec2-52-201-237-93.compute-1.amazonaws.com
export jh1_ssh_port=22
export jh1_ssh_user=ec2-user
./login_with_expect.sh
#ansible -i "aakrhel005.yellowykt.com," aakrhel005.yellowykt.com -m ping -e "ansible_port=2222" -e "ansible_user=ec2-user" -e "ansible_ssh_private_key_file=~/amazontestkey.pem" -e "ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ProxyCommand=\"/usr/bin/nc -X 5 -x 127.0.0.1:1234 %h %p\"'"
#pid=`ps -ef | grep ssh | grep "/tmp/mysock.sock" | grep -v grep | awk '{print $2}'`
#pid=`ps -ef | grep ssh | grep "127.0.0.1:1234" | grep -v grep | awk '{print $2}'`
#echo kill $pid
#kill $pid
