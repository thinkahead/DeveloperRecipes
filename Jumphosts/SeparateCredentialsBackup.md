We can separate the credentials for each jumphost in the secondary/backup chain by creating separate type for each jumphost in the chain as follows.

**backup_jumphost-hop1_credential_type**

INPUT CONFIGURATION
```
fields:
  - id: bjh1_ip
    type: string
    label: Backup Jumphost1 IP Address
  - id: bjh1_ssh_user
    type: string
    label: Backup Username to login with ssh in jumphost1
  - id: bjh1_ssh_private_key
    type: string
    label: Backup SSH Private Key for Jumphost1
    format: ssh_private_key
    secret: true
    multiline: true
  - id: bjh1_ssh_private_key_passphrase
    type: string
    label: Backup Optional Passphrase for SSH Private Key for Jumphost1
    secret: true
  - id: bjh1_ssh_port
    type: string
    label: Backup SSH port for Jumphost1
  - id: bjh1_socks_port
    type: string
    label: Backup Port on localhost to map with Jumphost1 port for socks5 proxy
required:
  - bjh1_ip
  - bjh1_ssh_user
  - bjh1_ssh_private_key
  - bjh1_ssh_port
  - bjh1_socks_port
```
INJECTOR CONFIGURATION
```
env:
  BJH1_SSH_PRIVATE_KEY: '{{tower.filename.bjh1_ssh_private_key}}'
  BJH1_SSH_PRIVATE_KEY_PASSPHRASE: '{{ bjh1_ssh_private_key_passphrase }}'
extra_vars:
  bjh1_ip: '{{ bjh1_ip }}'
  bjh1_socks_port: '{{ bjh1_socks_port }}'
  bjh1_ssh_port: '{{ bjh1_ssh_port }}'
  bjh1_ssh_user: '{{ bjh1_ssh_user }}'
file:
  template.bjh1_ssh_private_key: '{{ bjh1_ssh_private_key }}'
```
 
**backup_jumphost-hop2_credential_type**

INPUT CONFIGURATION
```
fields:
  - id: bjh2_ip
    type: string
    label: Backup Jumphost2 IP Address
  - id: bjh2_ssh_user
    type: string
    label: Backup Username to login with ssh in jumphost2
  - id: bjh2_ssh_private_key
    type: string
    label: Backup SSH Private Key for Jumphost2
    format: ssh_private_key
    secret: true
    multiline: true
  - id: bjh2_ssh_private_key_passphrase
    type: string
    label: Backup Optional Passphrase for SSH Private Key for Jumphost2
    secret: true
  - id: bjh2_ssh_port
    type: string
    label: Backup SSH port for Jumphost2
  - id: bjh2_socks_port
    type: string
    label: Backup Port on localhost to map with Jumphost2 port for socks5 proxy
required:
  - bjh2_ip
  - bjh2_ssh_user
  - bjh2_ssh_private_key
  - bjh2_ssh_port
  - bjh2_socks_port
```
INJECTOR CONFIGURATION
```
env:
  BJH2_SSH_PRIVATE_KEY: '{{tower.filename.bjh2_ssh_private_key}}'
  BJH2_SSH_PRIVATE_KEY_PASSPHRASE: '{{ bjh2_ssh_private_key_passphrase }}'
extra_vars:
  bjh2_ip: '{{ bjh2_ip }}'
  bjh2_socks_port: '{{ bjh2_socks_port }}'
  bjh2_ssh_port: '{{ bjh2_ssh_port }}'
  bjh2_ssh_user: '{{ bjh2_ssh_user }}'
file:
  template.bjh2_ssh_private_key: '{{ bjh2_ssh_private_key }}'
```

**backup_jumphost-hop3_credential_type**

INPUT CONFIGURATION
```
fields:
  - id: bjh3_ip
    type: string
    label: Backup Jumphost3 IP Address
  - id: bjh3_ssh_user
    type: string
    label: Backup Username to login with ssh in jumphost3
  - id: bjh3_ssh_private_key
    type: string
    label: Backup SSH Private Key for Jumphost3
    format: ssh_private_key
    secret: true
    multiline: true
  - id: bjh3_ssh_private_key_passphrase
    type: string
    label: Backup Optional Passphrase for SSH Private Key for Jumphost3
    secret: true
  - id: bjh3_ssh_port
    type: string
    label: Backup SSH port for Jumphost3
  - id: bjh3_socks_port
    type: string
    label: Backup Port on localhost to map with Jumphost3 port for socks5 proxy
required:
  - bjh3_ip
  - bjh3_ssh_user
  - bjh3_ssh_private_key
  - bjh3_ssh_port
  - bjh3_socks_port
```
INJECTOR CONFIGURATION
```
env:
  BJH3_SSH_PRIVATE_KEY: '{{tower.filename.bjh3_ssh_private_key}}'
  BJH3_SSH_PRIVATE_KEY_PASSPHRASE: '{{ bjh3_ssh_private_key_passphrase }}'
extra_vars:
  bjh3_ip: '{{ bjh3_ip }}'
  bjh3_socks_port: '{{ bjh3_socks_port }}'
  bjh3_ssh_port: '{{ bjh3_ssh_port }}'
  bjh3_ssh_user: '{{ bjh3_ssh_user }}'
file:
  template.bjh3_ssh_private_key: '{{ bjh3_ssh_private_key }}'
```
 
**backup_jumphost-hop4_credential_type**

INPUT CONFIGURATION
```
fields:
  - id: jh4_ip
    type: string
    label: Backup Jumphost4 IP Address
  - id: jh4_ssh_user
    type: string
    label: Backup Username to login with ssh in jumphost4
  - id: jh4_ssh_private_key
    type: string
    label: Backup SSH Private Key for Jumphost4
    format: ssh_private_key
    secret: true
    multiline: true
  - id: jh4_ssh_private_key_passphrase
    type: string
    label: Backup Optional Passphrase for SSH Private Key for Jumphost4
    secret: true
  - id: jh4_ssh_port
    type: string
    label: Backup SSH port for Jumphost4
  - id: jh4_socks_port
    type: string
    label: Backup Port on localhost to map with Jumphost4 port for socks5 proxy
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
  BJH4_SSH_PRIVATE_KEY: '{{tower.filename.jh4_ssh_private_key}}'
  BJH4_SSH_PRIVATE_KEY_PASSPHRASE: '{{ jh4_ssh_private_key_passphrase }}'
extra_vars:
  jh4_ip: '{{ jh4_ip }}'
  jh4_socks_port: '{{ jh4_socks_port }}'
  jh4_ssh_port: '{{ jh4_ssh_port }}'
  jh4_ssh_user: '{{ jh4_ssh_user }}'
file:
  template.jh4_ssh_private_key: '{{ jh4_ssh_private_key }}'
```
 
**backup_jumphost-hop5_credential_type**

INPUT CONFIGURATION
```
fields:
  - id: bjh5_ip
    type: string
    label: Backup Jumphost5 IP Address
  - id: bjh5_ssh_user
    type: string
    label: Backup Username to login with ssh in jumphost5
  - id: bjh5_ssh_private_key
    type: string
    label: Backup SSH Private Key for Jumphost5
    format: ssh_private_key
    secret: true
    multiline: true
  - id: bjh5_ssh_private_key_passphrase
    type: string
    label: Backup Optional Passphrase for SSH Private Key for Jumphost5
    secret: true
  - id: bjh5_ssh_port
    type: string
    label: Backup SSH port for Jumphost5
  - id: bjh5_socks_port
    type: string
    label: Backup Port on localhost to map with Jumphost5 port for socks5 proxy
required:
  - bjh5_ip
  - bjh5_ssh_user
  - bjh5_ssh_private_key
  - bjh5_ssh_port
  - bjh5_socks_port
```
INJECTOR CONFIGURATION
```
env:
  BJH5_SSH_PRIVATE_KEY: '{{tower.filename.bjh5_ssh_private_key}}'
  BJH5_SSH_PRIVATE_KEY_PASSPHRASE: '{{ bjh5_ssh_private_key_passphrase }}'
extra_vars:
  bjh5_ip: '{{ bjh5_ip }}'
  bjh5_socks_port: '{{ bjh5_socks_port }}'
  bjh5_ssh_port: '{{ bjh5_ssh_port }}'
  bjh5_ssh_user: '{{ bjh5_ssh_user }}'
file:
  template.bjh5_ssh_private_key: '{{ bjh5_ssh_private_key }}'
```
