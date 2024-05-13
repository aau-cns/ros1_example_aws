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
echo "BUILD called..."

set -e

cd ros_ws
source /opt/ros/noetic/setup.bash


FILE=${PWD}/src/CMakeLists.txt
if [ -f "$FILE" ]; then
  echo "* $FILE exists. \n"
else 
  echo "* $FILE does not exist. \n"
  cd ${PWD}/src
  
  catkin_init_workspace
  cd ..
fi

set -e

catkin build -j 1
cd ..
