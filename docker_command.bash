#!/bin/bash


/tmp/gazebo/install/bin/gzserver --verbose /tmp/gazebo/worlds/iris_standoff_demo.world&
cd /tmp/ardupilot/ArduCopter && sim_vehicle.sh -j 4 -f Gazebo
