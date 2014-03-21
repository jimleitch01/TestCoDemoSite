#!/bin/bash

#  instance-o-mizer.bash
#  deleetme
#
#  Created by Jim Leitch on 3/17/14.
#
FLAVOR=db2fc608-e6cf-4f59-a397-ba1c5043761d
IMAGE=af5ff05d-5b31-40d0-b240-0c4b6742c633
COLOR=$1
SERVERTYPE=$2


. ~/keystonerc_admin


INSTANCEID=`nova boot --key-name master  --flavor  $FLAVOR --image $IMAGE ${COLOR}-${SERVERTYPE} | grep " id " | awk '{print $4}'`
INSTANCEFLOATINGIP=`nova show $INSTANCEID | awk '{print $6}'

echo INSTANCEID=$INSTANCEID
echo INSTANCEFLOATINGIP=$INSTANCEFLOATINGIP


