Custom Credential Types for Multiple Jumphosts
----------------------------------------------

This shows the credential types to create a path of ssh credentials for all jumphosts that are required to reach the host endpoint. With this approach, only one custom credential with required number of hops in the path needs to be passed to the job.

Another way is to separate the individual ssh credentials in the path and pass each credential separately to the job. This mechanism requires passing as many credentials as there are hops to the job template. This is shown in [Separate Credential Types](SeparateCredentials.md)

The input configuration of the custom jumphost_credential_type specifies that this credential will have six fields: jh_ip, jh_ssh_user, jh_ssh_private_key, jh_ssh_private_key_passphrase, jh_ssh_port and jh_socks_port. Out of these six fields jh_ssh_private_key_passphrase is optional.

The injector configuration specifies how the fields of this credential will be made available to the playbooks at runtime. Our configuration specifies that the four fields jh_ip, jh_socks_port, jh_ssh_port. jh_ssh_user will be available as extra variables. The fields JH_SSH_PRIVATE_KEY and JH_SSH_PRIVATE_KEY_PASSPHRASE will be exposed as environment variables at runtime.

**jumphost_credential_type**

INPUT CONFIGURATION
```
fields:
  - id: jh_ip
    type: string
    label: Jumphost IP Address
  - id: jh_ssh_user
    type: string
    label: Username to login with ssh in jumphost
  - id: jh_ssh_private_key
    type: string
    label: SSH Private Key for Jumphost
    format: ssh_private_key
    secret: true
    multiline: true
  - id: jh_ssh_private_key_passphrase
    type: string
    label: Optional Passphrase for SSH Private Key for Jumphost
    secret: true
  - id: jh_ssh_port
    type: string
    label: SSH port for Jumphost
  - id: jh_socks_port
    type: string
    label: Port on localhost to map with Jumphost port for socks5 proxy
required:
  - jh_ip
  - jh_ssh_user
  - jh_ssh_private_key
  - jh_ssh_port
  - jh_socks_port
```
INJECTOR CONFIGURATION
```
env:
  JH_SSH_PRIVATE_KEY: '{{tower.filename.jh_ssh_private_key}}'
  JH_SSH_PRIVATE_KEY_PASSPHRASE: '{{ jh_ssh_private_key_passphrase }}'
extra_vars:
  jh_ip: '{{ jh_ip }}'
  jh_socks_port: '{{ jh_socks_port }}'
  jh_ssh_port: '{{ jh_ssh_port }}'
  jh_ssh_user: '{{ jh_ssh_user }}'
file:
  template.jh_ssh_private_key: '{{ jh_ssh_private_key }}'
```

**jumphost2_credential_type**

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
  - jh1_ip
  - jh1_ssh_user
  - jh1_ssh_private_key
  - jh1_ssh_port
  - jh1_socks_port
  - jh2_ip
  - jh2_ssh_user
  - jh2_ssh_private_key
  - jh2_ssh_port
  - jh2_socks_port
```
INJECTOR CONFIGURATION
```
env:
  JH1_SSH_PRIVATE_KEY: '{{tower.filename.jh1_ssh_private_key}}'
  JH1_SSH_PRIVATE_KEY_PASSPHRASE: '{{ jh1_ssh_private_key_passphrase }}'
  JH2_SSH_PRIVATE_KEY: '{{tower.filename.jh2_ssh_private_key}}'
  JH2_SSH_PRIVATE_KEY_PASSPHRASE: '{{ jh2_ssh_private_key_passphrase }}'
extra_vars:
  jh1_ip: '{{ jh1_ip }}'
  jh1_socks_port: '{{ jh1_socks_port }}'
  jh1_ssh_port: '{{ jh1_ssh_port }}'
  jh1_ssh_user: '{{ jh1_ssh_user }}'
  jh2_ip: '{{ jh2_ip }}'
  jh2_socks_port: '{{ jh2_socks_port }}'
  jh2_ssh_port: '{{ jh2_ssh_port }}'
  jh2_ssh_user: '{{ jh2_ssh_user }}'
file:
  template.jh1_ssh_private_key: '{{ jh1_ssh_private_key }}'
  template.jh2_ssh_private_key: '{{ jh2_ssh_private_key }}'
```
 
**jumphost3_credential_type**

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
  - jh1_ip
  - jh1_ssh_user
  - jh1_ssh_private_key
  - jh1_ssh_port
  - jh1_socks_port
  - jh2_ip
  - jh2_ssh_user
  - jh2_ssh_private_key
  - jh2_ssh_port
  - jh2_socks_port
  - jh3_ip
  - jh3_ssh_user
  - jh3_ssh_private_key
  - jh3_ssh_port
  - jh3_socks_port
```
INJECTOR CONFIGURATION
```
env:
  JH1_SSH_PRIVATE_KEY: '{{tower.filename.jh1_ssh_private_key}}'
  JH1_SSH_PRIVATE_KEY_PASSPHRASE: '{{ jh1_ssh_private_key_passphrase }}'
  JH2_SSH_PRIVATE_KEY: '{{tower.filename.jh2_ssh_private_key}}'
  JH2_SSH_PRIVATE_KEY_PASSPHRASE: '{{ jh2_ssh_private_key_passphrase }}'
  JH3_SSH_PRIVATE_KEY: '{{tower.filename.jh3_ssh_private_key}}'
  JH3_SSH_PRIVATE_KEY_PASSPHRASE: '{{ jh3_ssh_private_key_passphrase }}'
extra_vars:
  jh1_ip: '{{ jh1_ip }}'
  jh1_socks_port: '{{ jh1_socks_port }}'
  jh1_ssh_port: '{{ jh1_ssh_port }}'
  jh1_ssh_user: '{{ jh1_ssh_user }}'
  jh2_ip: '{{ jh2_ip }}'
  jh2_socks_port: '{{ jh2_socks_port }}'
  jh2_ssh_port: '{{ jh2_ssh_port }}'
  jh2_ssh_user: '{{ jh2_ssh_user }}'
  jh3_ip: '{{ jh3_ip }}'
  jh3_socks_port: '{{ jh3_socks_port }}'
  jh3_ssh_port: '{{ jh3_ssh_port }}'
  jh3_ssh_user: '{{ jh3_ssh_user }}'
file:
  template.jh1_ssh_private_key: '{{ jh1_ssh_private_key }}'
  template.jh2_ssh_private_key: '{{ jh2_ssh_private_key }}'
  template.jh3_ssh_private_key: '{{ jh3_ssh_private_key }}'
```

**jumphost4_credential_type**

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
  - jh1_ip
  - jh1_ssh_user
  - jh1_ssh_private_key
  - jh1_ssh_port
  - jh1_socks_port
  - jh2_ip
  - jh2_ssh_user
  - jh2_ssh_private_key
  - jh2_ssh_port
  - jh2_socks_port
  - jh3_ip
  - jh3_ssh_user
  - jh3_ssh_private_key
  - jh3_ssh_port
  - jh3_socks_port
  - jh4_ip
  - jh4_ssh_user
  - jh4_ssh_private_key
  - jh4_ssh_port
  - jh4_socks_port
```
INJECTOR CONFIGURATION
```
env:
  JH1_SSH_PRIVATE_KEY: '{{tower.filename.jh1_ssh_private_key}}'
  JH1_SSH_PRIVATE_KEY_PASSPHRASE: '{{ jh1_ssh_private_key_passphrase }}'
  JH2_SSH_PRIVATE_KEY: '{{tower.filename.jh2_ssh_private_key}}'
  JH2_SSH_PRIVATE_KEY_PASSPHRASE: '{{ jh2_ssh_private_key_passphrase }}'
  JH3_SSH_PRIVATE_KEY: '{{tower.filename.jh3_ssh_private_key}}'
  JH3_SSH_PRIVATE_KEY_PASSPHRASE: '{{ jh3_ssh_private_key_passphrase }}'
  JH4_SSH_PRIVATE_KEY: '{{tower.filename.jh4_ssh_private_key}}'
  JH4_SSH_PRIVATE_KEY_PASSPHRASE: '{{ jh4_ssh_private_key_passphrase }}'
extra_vars:
  jh1_ip: '{{ jh1_ip }}'
  jh1_socks_port: '{{ jh1_socks_port }}'
  jh1_ssh_port: '{{ jh1_ssh_port }}'
  jh1_ssh_user: '{{ jh1_ssh_user }}'
  jh2_ip: '{{ jh2_ip }}'
  jh2_socks_port: '{{ jh2_socks_port }}'
  jh2_ssh_port: '{{ jh2_ssh_port }}'
  jh2_ssh_user: '{{ jh2_ssh_user }}'
  jh3_ip: '{{ jh3_ip }}'
  jh3_socks_port: '{{ jh3_socks_port }}'
  jh3_ssh_port: '{{ jh3_ssh_port }}'
  jh3_ssh_user: '{{ jh3_ssh_user }}'
  jh4_ip: '{{ jh4_ip }}'
  jh4_socks_port: '{{ jh4_socks_port }}'
  jh4_ssh_port: '{{ jh4_ssh_port }}'
  jh4_ssh_user: '{{ jh4_ssh_user }}'
file:
  template.jh1_ssh_private_key: '{{ jh1_ssh_private_key }}'
  template.jh2_ssh_private_key: '{{ jh2_ssh_private_key }}'
  template.jh3_ssh_private_key: '{{ jh3_ssh_private_key }}'
  template.jh4_ssh_private_key: '{{ jh4_ssh_private_key }}'
```
 
**jumphost5_credential_type**

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
    label: Port on localhost to map with Jumphost4 port for socks5 proxy
required:
  - jh1_ip
  - jh1_ssh_user
  - jh1_ssh_private_key
  - jh1_ssh_port
  - jh1_socks_port
  - jh2_ip
  - jh2_ssh_user
  - jh2_ssh_private_key
  - jh2_ssh_port
  - jh2_socks_port
  - jh3_ip
  - jh3_ssh_user
  - jh3_ssh_private_key
  - jh3_ssh_port
  - jh3_socks_port
  - jh4_ip
  - jh4_ssh_user
  - jh4_ssh_private_key
  - jh4_ssh_port
  - jh4_socks_port
  - jh5_ip
  - jh5_ssh_user
  - jh5_ssh_private_key
  - jh5_ssh_port
  - jh5_socks_port
```
INJECTOR CONFIGURATION
```
env:
  JH1_SSH_PRIVATE_KEY: '{{tower.filename.jh1_ssh_private_key}}'
  JH1_SSH_PRIVATE_KEY_PASSPHRASE: '{{ jh1_ssh_private_key_passphrase }}'
  JH2_SSH_PRIVATE_KEY: '{{tower.filename.jh2_ssh_private_key}}'
  JH2_SSH_PRIVATE_KEY_PASSPHRASE: '{{ jh2_ssh_private_key_passphrase }}'
  JH3_SSH_PRIVATE_KEY: '{{tower.filename.jh3_ssh_private_key}}'
  JH3_SSH_PRIVATE_KEY_PASSPHRASE: '{{ jh3_ssh_private_key_passphrase }}'
  JH4_SSH_PRIVATE_KEY: '{{tower.filename.jh4_ssh_private_key}}'
  JH4_SSH_PRIVATE_KEY_PASSPHRASE: '{{ jh4_ssh_private_key_passphrase }}'
  JH5_SSH_PRIVATE_KEY: '{{tower.filename.jh5_ssh_private_key}}'
  JH5_SSH_PRIVATE_KEY_PASSPHRASE: '{{ jh5_ssh_private_key_passphrase }}'
extra_vars:
  jh1_ip: '{{ jh1_ip }}'
  jh1_socks_port: '{{ jh1_socks_port }}'
  jh1_ssh_port: '{{ jh1_ssh_port }}'
  jh1_ssh_user: '{{ jh1_ssh_user }}'
  jh2_ip: '{{ jh2_ip }}'
  jh2_socks_port: '{{ jh2_socks_port }}'
  jh2_ssh_port: '{{ jh2_ssh_port }}'
  jh2_ssh_user: '{{ jh2_ssh_user }}'
  jh3_ip: '{{ jh3_ip }}'
  jh3_socks_port: '{{ jh3_socks_port }}'
  jh3_ssh_port: '{{ jh3_ssh_port }}'
  jh3_ssh_user: '{{ jh3_ssh_user }}'
  jh4_ip: '{{ jh4_ip }}'
  jh4_socks_port: '{{ jh4_socks_port }}'
  jh4_ssh_port: '{{ jh4_ssh_port }}'
  jh4_ssh_user: '{{ jh4_ssh_user }}'
  jh5_ip: '{{ jh5_ip }}'
  jh5_socks_port: '{{ jh5_socks_port }}'
  jh5_ssh_port: '{{ jh5_ssh_port }}'
  jh5_ssh_user: '{{ jh5_ssh_user }}'
file:
  template.jh1_ssh_private_key: '{{ jh1_ssh_private_key }}'
  template.jh2_ssh_private_key: '{{ jh2_ssh_private_key }}'
  template.jh3_ssh_private_key: '{{ jh3_ssh_private_key }}'
  template.jh4_ssh_private_key: '{{ jh4_ssh_private_key }}'
  template.jh5_ssh_private_key: '{{ jh5_ssh_private_key }}'
```
