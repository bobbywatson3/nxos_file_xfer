#!/bin/bash

sudo pip install ansible --upgrade

git clone https://github.com/jedelman8/nxos-ansible.git
cp -r nxos-ansible/library/* library/

ansible-playbook tests/test.yml --syntax-check -i tests/inventory --list-tasks