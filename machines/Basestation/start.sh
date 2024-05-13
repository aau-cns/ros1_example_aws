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
  export ROS_IP=${master_ip}
else 
  echo "* No IP for ROS master was given."
  echo "* Standard [${master_ip}] is being used."
  export ROS_IP=${INVENTORY_IP}
fi 


source ros_ws/devel/setup.bash
export ROS_MASTER_URI=http://${master_ip}:11311
echo "* setting ROS_MASTER_URI=${ROS_MASTER_URI}"
echo "* setting ROS_IP=${ROS_IP}"

source ros_ws/devel/setup.bash

set +e

echo "KILL: ROSCORE + ROSMASTER"
killall -9 roscore
sleep 2
killall -9 rosmaster
sleep 2
echo "START: ROSCORE"
roscore &
sleep 2
echo "START: RQT"
rqt &
sleep 2
echo "LAUNCH: TBD"
