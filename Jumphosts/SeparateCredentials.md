We can separate the credentials for each jumphost in the chain by creating separate type for each jumphost in the chain as follows.

As an example: if you have two jumphosts in the chain, then you have to create credentials one for jumphost-1_credential_type and other for jumphost-2_credential_type and pass both of them to the job template that includes the role to create the tunnel.

If you have three jumphosts, then you need to add in the third credential for jumphost-3_credential_type and so on.

**jumphost-1_credential_type**

INPUT CONFIGURATION
```
fields:
  - id: jh1_ip
    type: string
    label: Jumphost1 IP Address
  - id: jh1_ssh_user
    type: string
    label: Username to login with ssh in jumphost1
  - id: jh1_ssh_private_key
    type: string
    label: SSH Private Key for Jumphost1
    format: ssh_private_key
    secret: true
    multiline: true
  - id: jh1_ssh_private_key_passphrase
    type: string
    label: Optional Passphrase for SSH Private Key for Jumphost1
    secret: true
  - id: jh1_ssh_port
    type: string
    label: SSH port for Jumphost1
  - id: jh1_socks_port
    type: string
    label: Port on localhost to map with Jumphost1 port for socks5 proxy
required:
  - jh1_ip
  - jh1_ssh_user
  - jh1_ssh_private_key
  - jh1_ssh_port
  - jh1_socks_port
```
INJECTOR CONFIGURATION
```
env:
  JH1_SSH_PRIVATE_KEY: '{{tower.filename.jh1_ssh_private_key}}'
  JH1_SSH_PRIVATE_KEY_PASSPHRASE: '{{ jh1_ssh_private_key_passphrase }}'
extra_vars:
  jh1_ip: '{{ jh1_ip }}'
  jh1_socks_port: '{{ jh1_socks_port }}'
  jh1_ssh_port: '{{ jh1_ssh_port }}'
  jh1_ssh_user: '{{ jh1_ssh_user }}'
file:
  template.jh1_ssh_private_key: '{{ jh1_ssh_private_key }}'
```
 
**jumphost-2_credential_type**

INPUT CONFIGURATION
```
fields:
  - id: jh2_ip
    type: string
    label: Jumphost2 IP Address
  - id: jh2_ssh_user
    type: string
    label: Username to login with ssh in jumphost2
  - id: jh2_ssh_private_key
    type: string
    label: SSH Private Key for Jumphost2
    format: ssh_private_key
    secret: true
    multiline: true
  - id: jh2_ssh_private_key_passphrase
    type: string
    label: Optional Passphrase for SSH Private Key for Jumphost2
    secret: true
  - id: jh2_ssh_port
    type: string
    label: SSH port for Jumphost2
  - id: jh2_socks_port
    type: string
    label: Port on localhost to map with Jumphost2 port for socks5 proxy
required:
  - jh2_ip
  - jh2_ssh_user
  - jh2_ssh_private_key
  - jh2_ssh_port
  - jh2_socks_port
```
INJECTOR CONFIGURATION
```
env:
  JH2_SSH_PRIVATE_KEY: '{{tower.filename.jh2_ssh_private_key}}'
  JH2_SSH_PRIVATE_KEY_PASSPHRASE: '{{ jh2_ssh_private_key_passphrase }}'
extra_vars:
  jh2_ip: '{{ jh2_ip }}'
  jh2_socks_port: '{{ jh2_socks_port }}'
  jh2_ssh_port: '{{ jh2_ssh_port }}'
  jh2_ssh_user: '{{ jh2_ssh_user }}'
file:
  template.jh2_ssh_private_key: '{{ jh2_ssh_private_key }}'
```

**jumphost-3_credential_type**

INPUT CONFIGURATION
```
fields:
  - id: jh3_ip
    type: string
    label: Jumphost3 IP Address
  - id: jh3_ssh_user
    type: string
    label: Username to login with ssh in jumphost3
  - id: jh3_ssh_private_key
    type: string
    label: SSH Private Key for Jumphost3
    format: ssh_private_key
    secret: true
    multiline: true
  - id: jh3_ssh_private_key_passphrase
    type: string
    label: Optional Passphrase for SSH Private Key for Jumphost3
    secret: true
  - id: jh3_ssh_port
    type: string
    label: SSH port for Jumphost3
  - id: jh3_socks_port
    type: string
    label: Port on localhost to map with Jumphost3 port for socks5 proxy
required:
  - jh3_ip
  - jh3_ssh_user
  - jh3_ssh_private_key
  - jh3_ssh_port
  - jh3_socks_port
```
INJECTOR CONFIGURATION
```
env:
  JH3_SSH_PRIVATE_KEY: '{{tower.filename.jh3_ssh_private_key}}'
  JH3_SSH_PRIVATE_KEY_PASSPHRASE: '{{ jh3_ssh_private_key_passphrase }}'
extra_vars:
  jh3_ip: '{{ jh3_ip }}'
  jh3_socks_port: '{{ jh3_socks_port }}'
  jh3_ssh_port: '{{ jh3_ssh_port }}'
  jh3_ssh_user: '{{ jh3_ssh_user }}'
file:
  template.jh3_ssh_private_key: '{{ jh3_ssh_private_key }}'
```
 
**jumphost-4_credential_type**

INPUT CONFIGURATION
```
fields:
  - id: jh4_ip
    type: string
    label: Jumphost4 IP Address
  - id: jh4_ssh_user
    type: string
    label: Username to login with ssh in jumphost4
  - id: jh4_ssh_private_key
    type: string
    label: SSH Private Key for Jumphost4
    format: ssh_private_key
    secret: true
    multiline: true
  - id: jh4_ssh_private_key_passphrase
    type: string
    label: Optional Passphrase for SSH Private Key for Jumphost4
    secret: true
  - id: jh4_ssh_port
    type: string
    label: SSH port for Jumphost4
  - id: jh4_socks_port
    type: string
    label: Port on localhost to map with Jumphost4 port for socks5 proxy
required:
  - jh4_ip
  - jh4_ssh_user
  - jh4_ssh_private_key
  - jh4_ssh_port
  - jh4_socks_port
```
INJECTOR CONFIGURATION
```
env:
  JH4_SSH_PRIVATE_KEY: '{{tower.filename.jh4_ssh_private_key}}'
  JH4_SSH_PRIVATE_KEY_PASSPHRASE: '{{ jh4_ssh_private_key_passphrase }}'
extra_vars:
  jh4_ip: '{{ jh4_ip }}'
  jh4_socks_port: '{{ jh4_socks_port }}'
  jh4_ssh_port: '{{ jh4_ssh_port }}'
  jh4_ssh_user: '{{ jh4_ssh_user }}'
file:
  template.jh4_ssh_private_key: '{{ jh4_ssh_private_key }}'
```
 
**jumphost-5_credential_type**

INPUT CONFIGURATION
```
fields:
  - id: jh5_ip
    type: string
    label: Jumphost5 IP Address
  - id: jh5_ssh_user
    type: string
    label: Username to login with ssh in jumphost5
  - id: jh5_ssh_private_key
    type: string
    label: SSH Private Key for Jumphost5
    format: ssh_private_key
    secret: true
    multiline: true
  - id: jh5_ssh_private_key_passphrase
    type: string
    label: Optional Passphrase for SSH Private Key for Jumphost5
    secret: true
  - id: jh5_ssh_port
    type: string
    label: SSH port for Jumphost5
  - id: jh5_socks_port
    type: string
    label: Port on localhost to map with Jumphost5 port for socks5 proxy
required:
  - jh5_ip
  - jh5_ssh_user
  - jh5_ssh_private_key
  - jh5_ssh_port
  - jh5_socks_port
```
INJECTOR CONFIGURATION
```
env:
  JH5_SSH_PRIVATE_KEY: '{{tower.filename.jh5_ssh_private_key}}'
  JH5_SSH_PRIVATE_KEY_PASSPHRASE: '{{ jh5_ssh_private_key_passphrase }}'
extra_vars:
  jh5_ip: '{{ jh5_ip }}'
  jh5_socks_port: '{{ jh5_socks_port }}'
  jh5_ssh_port: '{{ jh5_ssh_port }}'
  jh5_ssh_user: '{{ jh5_ssh_user }}'
file:
  template.jh5_ssh_private_key: '{{ jh5_ssh_private_key }}'
```
