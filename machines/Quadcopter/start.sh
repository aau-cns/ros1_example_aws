#! /bin/bash
################################################################################
#
# Copyright (C) 2024 Roland Jung, University of Klagenfurt, Austria.
#
# All rights reserved.
#
# This software is licensed under the terms of the MIT License, the full terms 
# of which are made available in the LICENSE file.
#
# You can contact the author at roland.jung@aau.at
#
################################################################################
echo "START CALLED...."

master_ip="localhost"
if [ $# -gt 0 ]; then
  master_ip=$1
  echo "ROS master IP =[${master_ip}]." 
else 
  echo "* No IP for ROS master was given."
  echo "* Standard [${master_ip}] is being used."
fi 

source ros_ws/devel/setup.bash
export ROS_MASTER_URI=http://${master_ip}:11311
echo "* setting ROS_MASTER_URI=${ROS_MASTER_URI}"


if [ $# -gt 1 ]; then
  export ROS_IP=$2
else
  echo "*  No IP for local machine was given -> using INVENTORY_IP instead"  
  export ROS_IP=${INVENTORY_IP}
fi
echo "* setting ROS_IP=${ROS_IP}"


echo "* LAUNCH:"
roslaunch bringup default.launch host_name:=`hostname`
