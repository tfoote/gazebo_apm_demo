#!/bin/bash

docker run -ti -e "DISPLAY=unix:0.0" --net=host -v="/tmp/.X11-unix:/tmp/.X11-unix:rw" --privileged gazebo_apm_demo
