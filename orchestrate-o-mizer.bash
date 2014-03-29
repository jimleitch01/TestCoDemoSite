#!/bin/bash
# Run ansible playbooks
COLOR=$1


sudo ansible-playbook -i /etc/ansible/hosts playbooks/homegrown/testco_init.yaml
sudo ansible-playbook -i /etc/ansible/hosts playbooks/examples/lamp_simple/site.yml 
sudo ansible-playbook -i /etc/ansible/hosts playbooks/examples/jboss-standalone/site.yml 

echo +++Rebooting all $COLOR servers
ansible $COLOR -m command -a "/sbin/reboot -t now"







