Custom Backup Credential Types for Multiple Jumphosts
-----------------------------------------------------

This shows the backup credential types to create a path of ssh credentials for all jumphosts that are required to reach the host endpoint. With this approach, only one custom credential with required number of hops in the path needs to be passed to the job.

Another way is to separate the individual ssh credentials in the path and pass each credential separately to the job. This mechanism requires passing as many credentials as there are hops to the job template. This is shown in [Separate Backup Credential Types](SeparateCredentialsBackup.md)

The input configuration of the custom jumphost_credential_type specifies that this credential will have six fields: bjh_ip, bjh_ssh_user, bjh_ssh_private_key, bjh_ssh_private_key_passphrase, bjh_ssh_port and bjh_socks_port. Out of these six fields bjh_ssh_private_key_passphrase is optional.

The injector configuration specifies how the fields of this credential will be made available to the playbooks at runtime. Our configuration specifies that the four fields bjh_ip, bjh_socks_port, bjh_ssh_port. bjh_ssh_user will be available as extra variables. The fields BJH_SSH_PRIVATE_KEY and BJH_SSH_PRIVATE_KEY_PASSPHRASE will be exposed as environment variables at runtime.

**backup_jumphost_credential_type**

INPUT CONFIGURATION
```
fields:
  - id: bjh_ip
    type: string
    label: Backup Jumphost IP Address
  - id: bjh_ssh_user
    type: string
    label: Backup Username to login with ssh in jumphost
  - id: bjh_ssh_private_key
    type: string
    label: Backup SSH Private Key for Jumphost
    format: ssh_private_key
    secret: true
    multiline: true
  - id: bjh_ssh_private_key_passphrase
    type: string
    label: Backup Optional Passphrase for SSH Private Key for Jumphost
    secret: true
  - id: bjh_ssh_port
    type: string
    label: Backup SSH port for Jumphost
  - id: bjh_socks_port
    type: string
    label: Backup Port on localhost to map with Jumphost port for socks5 proxy
required:
  - bjh_ip
  - bjh_ssh_user
  - bjh_ssh_private_key
  - bjh_ssh_port
  - bjh_socks_port
```
INJECTOR CONFIGURATION
```
env:
  BJH_SSH_PRIVATE_KEY: '{{ tower.filename.bjh_ssh_private_key }}'
  BJH_SSH_PRIVATE_KEY_PASSPHRASE: '{{ bjh_ssh_private_key_passphrase }}'
extra_vars:
  bjh_ip: '{{ bjh_ip }}'
  bjh_socks_port: '{{ bjh_socks_port }}'
  bjh_ssh_port: '{{ bjh_ssh_port }}'
  bjh_ssh_user: '{{ bjh_ssh_user }}'
file:
  template.bjh_ssh_private_key: '{{ bjh_ssh_private_key }}'
```

**backup_jumphost2_credential_type**

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
  - bjh1_ip
  - bjh1_ssh_user
  - bjh1_ssh_private_key
  - bjh1_ssh_port
  - bjh1_socks_port
  - bjh2_ip
  - bjh2_ssh_user
  - bjh2_ssh_private_key
  - bjh2_ssh_port
  - bjh2_socks_port
```
INJECTOR CONFIGURATION
```
env:
  BJH1_SSH_PRIVATE_KEY: '{{tower.filename.bjh1_ssh_private_key}}'
  BJH1_SSH_PRIVATE_KEY_PASSPHRASE: '{{ bjh1_ssh_private_key_passphrase }}'
  BJH2_SSH_PRIVATE_KEY: '{{tower.filename.bjh2_ssh_private_key}}'
  BJH2_SSH_PRIVATE_KEY_PASSPHRASE: '{{ bjh2_ssh_private_key_passphrase }}'
extra_vars:
  bjh1_ip: '{{ bjh1_ip }}'
  bjh1_socks_port: '{{ bjh1_socks_port }}'
  bjh1_ssh_port: '{{ bjh1_ssh_port }}'
  bjh1_ssh_user: '{{ bjh1_ssh_user }}'
  bjh2_ip: '{{ bjh2_ip }}'
  bjh2_socks_port: '{{ bjh2_socks_port }}'
  bjh2_ssh_port: '{{ bjh2_ssh_port }}'
  bjh2_ssh_user: '{{ bjh2_ssh_user }}'
file:
  template.bjh1_ssh_private_key: '{{ bjh1_ssh_private_key }}'
  template.bjh2_ssh_private_key: '{{ bjh2_ssh_private_key }}'
```
 
**backup_jumphost3_credential_type**

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
  - bjh1_ip
  - bjh1_ssh_user
  - bjh1_ssh_private_key
  - bjh1_ssh_port
  - bjh1_socks_port
  - bjh2_ip
  - bjh2_ssh_user
  - bjh2_ssh_private_key
  - bjh2_ssh_port
  - bjh2_socks_port
  - bjh3_ip
  - bjh3_ssh_user
  - bjh3_ssh_private_key
  - bjh3_ssh_port
  - bjh3_socks_port
```
INJECTOR CONFIGURATION
```
env:
  BJH1_SSH_PRIVATE_KEY: '{{tower.filename.bjh1_ssh_private_key}}'
  BJH1_SSH_PRIVATE_KEY_PASSPHRASE: '{{ bjh1_ssh_private_key_passphrase }}'
  BJH2_SSH_PRIVATE_KEY: '{{tower.filename.bjh2_ssh_private_key}}'
  BJH2_SSH_PRIVATE_KEY_PASSPHRASE: '{{ bjh2_ssh_private_key_passphrase }}'
  BJH3_SSH_PRIVATE_KEY: '{{tower.filename.bjh3_ssh_private_key}}'
  BJH3_SSH_PRIVATE_KEY_PASSPHRASE: '{{ bjh3_ssh_private_key_passphrase }}'
extra_vars:
  bjh1_ip: '{{ bjh1_ip }}'
  bjh1_socks_port: '{{ bjh1_socks_port }}'
  bjh1_ssh_port: '{{ bjh1_ssh_port }}'
  bjh1_ssh_user: '{{ bjh1_ssh_user }}'
  bjh2_ip: '{{ bjh2_ip }}'
  bjh2_socks_port: '{{ bjh2_socks_port }}'
  bjh2_ssh_port: '{{ bjh2_ssh_port }}'
  bjh2_ssh_user: '{{ bjh2_ssh_user }}'
  bjh3_ip: '{{ bjh3_ip }}'
  bjh3_socks_port: '{{ bjh3_socks_port }}'
  bjh3_ssh_port: '{{ bjh3_ssh_port }}'
  bjh3_ssh_user: '{{ bjh3_ssh_user }}'
file:
  template.bjh1_ssh_private_key: '{{ bjh1_ssh_private_key }}'
  template.bjh2_ssh_private_key: '{{ bjh2_ssh_private_key }}'
  template.bjh3_ssh_private_key: '{{ bjh3_ssh_private_key }}'
```

**backup_jumphost4_credential_type**

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
  - id: bjh4_ip
    type: string
    label: Backup Jumphost4 IP Address
  - id: bjh4_ssh_user
    type: string
    label: Backup Username to login with ssh in jumphost4
  - id: bjh4_ssh_private_key
    type: string
    label: Backup SSH Private Key for Jumphost4
    format: ssh_private_key
    secret: true
    multiline: true
  - id: bjh4_ssh_private_key_passphrase
    type: string
    label: Backup Optional Passphrase for SSH Private Key for Jumphost4
    secret: true
  - id: bjh4_ssh_port
    type: string
    label: Backup SSH port for Jumphost4
  - id: bjh4_socks_port
    type: string
    label: Backup Port on localhost to map with Jumphost4 port for socks5 proxy
required:
  - bjh1_ip
  - bjh1_ssh_user
  - bjh1_ssh_private_key
  - bjh1_ssh_port
  - bjh1_socks_port
  - bjh2_ip
  - bjh2_ssh_user
  - bjh2_ssh_private_key
  - bjh2_ssh_port
  - bjh2_socks_port
  - bjh3_ip
  - bjh3_ssh_user
  - bjh3_ssh_private_key
  - bjh3_ssh_port
  - bjh3_socks_port
  - bjh4_ip
  - bjh4_ssh_user
  - bjh4_ssh_private_key
  - bjh4_ssh_port
  - bjh4_socks_port
```
INJECTOR CONFIGURATION
```
env:
  BJH1_SSH_PRIVATE_KEY: '{{tower.filename.bjh1_ssh_private_key}}'
  BJH1_SSH_PRIVATE_KEY_PASSPHRASE: '{{ bjh1_ssh_private_key_passphrase }}'
  BJH2_SSH_PRIVATE_KEY: '{{tower.filename.bjh2_ssh_private_key}}'
  BJH2_SSH_PRIVATE_KEY_PASSPHRASE: '{{ bjh2_ssh_private_key_passphrase }}'
  BJH3_SSH_PRIVATE_KEY: '{{tower.filename.bjh3_ssh_private_key}}'
  BJH3_SSH_PRIVATE_KEY_PASSPHRASE: '{{ bjh3_ssh_private_key_passphrase }}'
  BJH4_SSH_PRIVATE_KEY: '{{tower.filename.bjh4_ssh_private_key}}'
  BJH4_SSH_PRIVATE_KEY_PASSPHRASE: '{{ bjh4_ssh_private_key_passphrase }}'
extra_vars:
  bjh1_ip: '{{ bjh1_ip }}'
  bjh1_socks_port: '{{ bjh1_socks_port }}'
  bjh1_ssh_port: '{{ bjh1_ssh_port }}'
  bjh1_ssh_user: '{{ bjh1_ssh_user }}'
  bjh2_ip: '{{ bjh2_ip }}'
  bjh2_socks_port: '{{ bjh2_socks_port }}'
  bjh2_ssh_port: '{{ bjh2_ssh_port }}'
  bjh2_ssh_user: '{{ bjh2_ssh_user }}'
  bjh3_ip: '{{ bjh3_ip }}'
  bjh3_socks_port: '{{ bjh3_socks_port }}'
  bjh3_ssh_port: '{{ bjh3_ssh_port }}'
  bjh3_ssh_user: '{{ bjh3_ssh_user }}'
  bjh4_ip: '{{ bjh4_ip }}'
  bjh4_socks_port: '{{ bjh4_socks_port }}'
  bjh4_ssh_port: '{{ bjh4_ssh_port }}'
  bjh4_ssh_user: '{{ bjh4_ssh_user }}'
file:
  template.bjh1_ssh_private_key: '{{ bjh1_ssh_private_key }}'
  template.bjh2_ssh_private_key: '{{ bjh2_ssh_private_key }}'
  template.bjh3_ssh_private_key: '{{ bjh3_ssh_private_key }}'
  template.bjh4_ssh_private_key: '{{ bjh4_ssh_private_key }}'
```
 
**backup_jumphost5_credential_type**

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
  - id: bjh4_ip
    type: string
    label: Backup Jumphost4 IP Address
  - id: bjh4_ssh_user
    type: string
    label: Backup Username to login with ssh in jumphost4
  - id: bjh4_ssh_private_key
    type: string
    label: Backup SSH Private Key for Jumphost4
    format: ssh_private_key
    secret: true
    multiline: true
  - id: bjh4_ssh_private_key_passphrase
    type: string
    label: Backup Optional Passphrase for SSH Private Key for Jumphost4
    secret: true
  - id: bjh4_ssh_port
    type: string
    label: Backup SSH port for Jumphost4
  - id: bjh4_socks_port
    type: string
    label: Backup Port on localhost to map with Jumphost4 port for socks5 proxy
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
    label: Backup Port on localhost to map with Jumphost4 port for socks5 proxy
required:
  - bjh1_ip
  - bjh1_ssh_user
  - bjh1_ssh_private_key
  - bjh1_ssh_port
  - bjh1_socks_port
  - bjh2_ip
  - bjh2_ssh_user
  - bjh2_ssh_private_key
  - bjh2_ssh_port
  - bjh2_socks_port
  - bjh3_ip
  - bjh3_ssh_user
  - bjh3_ssh_private_key
  - bjh3_ssh_port
  - bjh3_socks_port
  - bjh4_ip
  - bjh4_ssh_user
  - bjh4_ssh_private_key
  - bjh4_ssh_port
  - bjh4_socks_port
  - bjh5_ip
  - bjh5_ssh_user
  - bjh5_ssh_private_key
  - bjh5_ssh_port
  - bjh5_socks_port
```
INJECTOR CONFIGURATION
```
env:
  BJH1_SSH_PRIVATE_KEY: '{{tower.filename.bjh1_ssh_private_key}}'
  BJH1_SSH_PRIVATE_KEY_PASSPHRASE: '{{ bjh1_ssh_private_key_passphrase }}'
  BJH2_SSH_PRIVATE_KEY: '{{tower.filename.bjh2_ssh_private_key}}'
  BJH2_SSH_PRIVATE_KEY_PASSPHRASE: '{{ bjh2_ssh_private_key_passphrase }}'
  BJH3_SSH_PRIVATE_KEY: '{{tower.filename.bjh3_ssh_private_key}}'
  BJH3_SSH_PRIVATE_KEY_PASSPHRASE: '{{ bjh3_ssh_private_key_passphrase }}'
  BJH4_SSH_PRIVATE_KEY: '{{tower.filename.bjh4_ssh_private_key}}'
  BJH4_SSH_PRIVATE_KEY_PASSPHRASE: '{{ bjh4_ssh_private_key_passphrase }}'
  BJH5_SSH_PRIVATE_KEY: '{{tower.filename.bjh5_ssh_private_key}}'
  BJH5_SSH_PRIVATE_KEY_PASSPHRASE: '{{ bjh5_ssh_private_key_passphrase }}'
extra_vars:
  bjh1_ip: '{{ bjh1_ip }}'
  bjh1_socks_port: '{{ bjh1_socks_port }}'
  bjh1_ssh_port: '{{ bjh1_ssh_port }}'
  bjh1_ssh_user: '{{ bjh1_ssh_user }}'
  bjh2_ip: '{{ bjh2_ip }}'
  bjh2_socks_port: '{{ bjh2_socks_port }}'
  bjh2_ssh_port: '{{ bjh2_ssh_port }}'
  bjh2_ssh_user: '{{ bjh2_ssh_user }}'
  bjh3_ip: '{{ bjh3_ip }}'
  bjh3_socks_port: '{{ bjh3_socks_port }}'
  bjh3_ssh_port: '{{ bjh3_ssh_port }}'
  bjh3_ssh_user: '{{ bjh3_ssh_user }}'
  bjh4_ip: '{{ bjh4_ip }}'
  bjh4_socks_port: '{{ bjh4_socks_port }}'
  bjh4_ssh_port: '{{ bjh4_ssh_port }}'
  bjh4_ssh_user: '{{ bjh4_ssh_user }}'
  bjh5_ip: '{{ bjh5_ip }}'
  bjh5_socks_port: '{{ bjh5_socks_port }}'
  bjh5_ssh_port: '{{ bjh5_ssh_port }}'
  bjh5_ssh_user: '{{ bjh5_ssh_user }}'
file:
  template.bjh1_ssh_private_key: '{{ bjh1_ssh_private_key }}'
  template.bjh2_ssh_private_key: '{{ bjh2_ssh_private_key }}'
  template.bjh3_ssh_private_key: '{{ bjh3_ssh_private_key }}'
  template.bjh4_ssh_private_key: '{{ bjh4_ssh_private_key }}'
  template.bjh5_ssh_private_key: '{{ bjh5_ssh_private_key }}'
```
