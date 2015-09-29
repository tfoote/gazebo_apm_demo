FROM gazebo
MAINTAINER Tully Foote <tfoote@osrfoundation.org>


RUN apt-get update && apt-get install -y python-setuptools mercurial ssh git cmake protobuf-compiler libsdformat3-dev
RUN apt-get update && apt-get install nvidia-340 --no-install-recommends -y

# Compile gazebo
WORKDIR /tmp
RUN hg clone https://bitbucket.org/osrf/gazebo -b aero_default
RUN mkdir -p /tmp/gazebo/build
WORKDIR /tmp/gazebo/build
RUN cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/tmp/gazebo/install
RUN make -j8
RUN make install

# Fetch a few updated models
RUN mkdir -p ~/.gazebo/models
WORKDIR /tmp
RUN hg clone https://bitbucket.org/osrf/gazebo_models -b aero_testing_john
RUN cp -r gazebo_models/iris_test ~/.gazebo/models
RUN cp -r /tmp/gazebo_models/small_2d_gimbal ~/.gazebo/models

# Get a modified version of ardupilot.
RUN git clone https://github.com/hsu/ardupilot.git -b gazebo_sitl
WORKDIR /tmp/ardupilot
RUN apt-get update && apt-get install -y gawk
RUN make

# Install mabproxy as well
WORKDIR /tmp
RUN git clone https://github.com/tridge/MAVProxy.git
WORKDIR /tmp/MAVProxy
RUN python setup.py build install

# Setup the entry point and command to run.
ADD entrypoint.sh /entrypoint.sh
ADD docker_command.bash /docker_command.bash
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/docker_command.bash"]
