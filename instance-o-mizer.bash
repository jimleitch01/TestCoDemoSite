#!/bin/bash

#  instance-o-mizer.bash
#  
#
#  Created by Jim Leitch on 3/17/14.
#

. ~/keystonerc_admin
COLOR=$1
SERVERTYPE=$2


nova boot --key-name master  --flavor db2fc608-e6cf-4f59-a397-ba1c5043761d --image af5ff05d-5b31-40d0-b240-0c4b6742c633 ${COLOR}-${SERVERTYPE}



