Endpoint Credential Type
------------------------

This custom type may be used instead of the default Machine Credential Type provided by Ansible Tower in Part 4.

**endpoint_credential_type**

INPUT CONFIGURATION
```
fields:
  - id: endpoint_ip
    type: string
    label: Endpoint IP Address
  - id: endpoint_ssh_user
    type: string
    label: Username to login with ssh in endpoint
  - id: endpoint_ssh_private_key
    type: string
    label: SSH Private Key for endpoint
    format: ssh_private_key
    secret: true
    multiline: true
  - id: endpoint_ssh_private_key_passphrase
    type: string
    label: Optional Passphrase for SSH Private Key for endpoint
    secret: true
  - id: endpoint_ssh_port
    type: string
    label: SSH port for endpoint
required:
  - endpoint_ip
  - endpoint_ssh_user
  - endpoint_ssh_private_key
  - endpoint_ssh_port
```
INJECTOR CONFIGURATION
```
env:
 EP_SSH_PRIVATE_KEY: '{{tower.filename.endpoint_ssh_private_key}}'
 EP_SSH_PRIVATE_KEY_PASSPHRASE: '{{ endpoint_ssh_private_key_passphrase }}'
extra_vars:
 endpoint_ip: '{{ endpoint_ip }}'
 endpoint_ssh_port: '{{ endpoint_ssh_port }}'
 endpoint_ssh_user: '{{ endpoint_ssh_user }}'
file:
  template.endpoint_ssh_private_key: '{{ endpoint_ssh_private_key }}'
```
