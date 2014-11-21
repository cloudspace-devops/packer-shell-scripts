#!/bin/bash -eux

# Setup sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'

# Add ROS keys
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -

# Install ROS
sudo apt-get update
sudo apt-get install -y ros-indigo-desktop-full

# Initialize rosdep
sudo rosdep init
rosdep update
sudo chmod 777 /opt/ros/indigo/setup.bash

# Setup environment
echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Setup rosinstall
sudo apt-get install -y python-rosinstall

# Setup ROS Workspace
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
cd ~/catkin_ws/
catkin_make
source devel/setup.bash
