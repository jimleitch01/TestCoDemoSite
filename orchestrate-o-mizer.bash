#!/bin/bash

# Run ansible playbooks

sudo ansible-playbook -i /etc/ansible/hosts playbooks/homegrown/testco_init.yaml
echo [NOT] sleeping 120 for reboots
###sleep 120
sudo ansible-playbook -i /etc/ansible/hosts playbooks/examples/lamp_simple/site.yml 
sudo ansible-playbook -i /etc/ansible/hosts playbooks/examples/jboss-standalone/site.yml 

echo Rebooting all $COLOR servers
ansible $COLOR -m command -a "/sbin/reboot -t now"







