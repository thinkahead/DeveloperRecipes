import paramiko
import socks

try:
    #socks.set_default_proxy(proxy_type=socks.SOCKS5,addr="/tmp/mysock.sock") # This does not work

    # Option 1: Use Unix Socket File
    #s=socks.create_connection(("aakrhel005.yellowykt.com",2222), timeout=5, proxy_type=socks.SOCKS5, proxy_addr="/tmp/mysock.sock")

    # Option 2: Use Socks Port
    #s=socks.create_connection(("aakrhel005.yellowykt.com",2222), timeout=5, proxy_type=socks.SOCKS5, proxy_addr="127.0.0.1", proxy_port=1234)

    # Option 3: Use Socks Port
    s = socks.socksocket()
    s.set_proxy(proxy_type=socks.SOCKS5, addr="127.0.0.1", port=1234)
    s.connect(("aakrhel005.yellowykt.com",2222))

    k = paramiko.RSAKey.from_private_key_file('/var/lib/awx/amazontestkey.pem')
    transport = paramiko.Transport(s)
    transport.connect(username="ec2-user", pkey=k)
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh._transport = transport
    commands = [ "hostname", "pwd" ]
    for command in commands:
        print "Executing {}:".format( command )
        stdin, stdout, stderr = ssh.exec_command(command)
        print stdout.read()
        print( "Errors:")
        print stderr.read()
    ssh.close()
    transport.close()
except Exception, err:
    print(err)
    print('Error connecting to Host')
