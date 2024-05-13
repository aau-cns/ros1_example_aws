cmake_minimum_required(VERSION 2.8.3)
project(bringup)

# refer: https://github.com/turtlebot/turtlebot/blob/kinetic/turtlebot_bringup/CMakeLists.txt

find_package(catkin REQUIRED COMPONENTS)


catkin_package()

install(DIRECTORY
  launch
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/launch
)
