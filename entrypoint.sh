#!/bin/bash

# Source gazebo/install/share/gazebo/setup.sh
source /tmp/gazebo/install/share/gazebo/setup.sh
# Add gazebo/install/lib to LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/tmp/gazebo/install/lib//x86_64-linux-gnu

export GAZEBO_RESOURCE_PATH=$GAZEBO_RESOURCE_PATH:/root/.gazebo/models
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/root/.gazebo/models
# Add ardupilot/Tools/autotest to the path
export PATH=$PATH:/tmp/ardupilot/Tools/autotest

exec "$@"
