#!/bin/bash
xpanes -c "ssh $1@{}" myhost01 myhost01

## Use ansible to get hosts dynamically
## $1 specifies the username on the host machines
## $2 specifies the environment of the ansible hosts file
## xpanes -c "ssh $1@{}" $(ansible -i /data/inventories/hosts.$2.yml all --list-hosts | grep dl)
