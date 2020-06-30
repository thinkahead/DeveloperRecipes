from winrm.protocol import Protocol
import argparse

parser = argparse.ArgumentParser(description='Run command on Windows host')
parser.add_argument("--host", required=True)
parser.add_argument("--port", default=5985)
parser.add_argument("--socksport", default=1234)
parser.add_argument("--username", required=True)
parser.add_argument("--password", required=True)
parser.add_argument("--protocol", default="http")
parser.add_argument("--transport", default="basic")

args = parser.parse_args()

# Run process with low-level API
p = Protocol(
    endpoint=args.protocol+'://'+args.host+':'+(args.port)+'/wsman',
    transport=args.transport,
    username=args.username,
    password=args.password,
    server_cert_validation='ignore',
    proxy='socks5h://localhost:'+str(args.socksport))
shell_id = p.open_shell()

command_id = p.run_command(shell_id, 'ipconfig', ['/all'])
std_out, std_err, status_code = p.get_command_output(shell_id, command_id)
p.cleanup_command(shell_id, command_id)
p.close_shell(shell_id)
print(status_code)
print(std_out)
print(std_err)
