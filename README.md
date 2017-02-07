nxos_file_xfer
=========
[![Build Status](https://travis-ci.org/bobbywatson3/nxos_file_xfer.svg?branch=master)](https://travis-ci.org/robertwatson3/nxos_file_xfer)

This is a role for transferring (large or small) files to NXOS devices. The role will copy the file to
a switch. If desired, the switch can then be used as an SCP server by using the "switch_scp_server" option. Then all additional switches in the play will use
that switch as the file server in order to speed up the transfer process at remote sites. If "switch_scp_server" is not set to true, files will be sent directly to all switches without using a switch as a local file server.

Requirements
------------

- Ansible 2.0
- pexpect (pip install pexpect)
- nxos-ansible (git clone https://github.com/jedelman8/nxos-ansible.git)
- dnspython (only required if using NXOS switch as SCP server)
- NXAPI enabled on switches

Role Variables
--------------
```YAML
---
log_file_dir: "{{ playbook_dir }}/logs/"
enable_logging: True
transport: scp
ftp_timeout: 600
firmware_destination: "bootflash:"
switch_vrf: management
firmware_force: false
switch_scp_server: false
```
Example Playbook
----------------
```YAML
---
- hosts: nxos
  connection: local
  gather_facts: yes
  
  roles:
    - nxos_file_xfer

  vars:
    files:
      - firmware_file.bin
      - epld_file.bin
      - config_file.cfg
    firmware_remote_server_path: /scp
    firmware_remote_server: 10.0.0.1
    switch_scp_server: False
    firmware_force: False
    transport: scp

  vars_prompt:
    - name: switch_username
      prompt: "What is the switch username?"
      private: False
    - name: switch_password
      prompt: "What is the switch password?"
    - name: firmware_remote_user
      prompt: "What is the firmware file server username?"
      private: False
    - name: firmware_remote_password
      prompt: "What is the firmware file server password?"
```

License
-------

BSD

Author Information
------------------

Bobby Watson (bwatsoni@cisco.com, robertwatson3@gmail.com)
