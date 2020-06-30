from winrm.protocol import Protocol
import winrm
import argparse
from base64 import b64encode

script = """$strComputer = $Host
Clear
$RAM = WmiObject Win32_ComputerSystem
$MB = 1048576

"Installed Memory: " + [int]($RAM.TotalPhysicalMemory /$MB) + " MB" """

cmd = """

# Load script from env-vars
. ([ScriptBlock]::Create($Env:WINRM_SCRIPT))
"""
encoded_cmd = b64encode(cmd.encode('utf_16_le')).decode('ascii')

parser = argparse.ArgumentParser(description='Run command on Windows host')
parser.add_argument("--host", required=True)
parser.add_argument("--port", default=5985)
parser.add_argument("--socksport", default=1234)
parser.add_argument("--username", required=True)
parser.add_argument("--password", required=True)
parser.add_argument("--protocol", default="http")
parser.add_argument("--transport", default="basic")

args = parser.parse_args()

p = Protocol(
    endpoint=args.protocol+'://'+args.host+':'+(args.port)+'/wsman',
    transport=args.transport,
    username=args.username,
    password=args.password,
    server_cert_validation='ignore',
    proxy='socks5h://localhost:'+str(args.socksport))

# Load script to env vars.
shell_id = p.open_shell(env_vars=dict(WINRM_SCRIPT=script))
command_id = p.run_command(shell_id, "powershell -EncodedCommand {}".format(encoded_cmd))

#rs = winrm.Response(p.get_command_output(shell, command)
#print(str(rs.std_out, 'ascii'))
std_out, std_err, status_code = p.get_command_output(shell_id, command_id)
p.cleanup_command(shell_id, command_id)
p.close_shell(shell_id)
print("status_code:",status_code)
print("std_out:")
#print(str(std_out, 'ascii')) # python3 only
print(str(std_out).encode('ascii'))
print("std_err:")
#print(str(std_err, 'ascii')) # python3 only
print(str(std_err).encode('ascii'))
