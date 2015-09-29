FROM gazebo
MAINTAINER Tully Foote <tfoote@osrfoundation.org>


RUN apt-get update && apt-get install -y mercurial ssh git cmake protobuf-compiler libsdformat3-dev

WORKDIR /tmp
RUN hg clone https://bitbucket.org/osrf/gazebo -b aero_default
RUN mkdir -p /tmp/gazebo/build
WORKDIR /tmp/gazebo/build
RUN cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/tmp/gazebo/install
RUN make -j8
RUN make install


RUN mkdir -p ~/.gazebo/models
WORKDIR /tmp
RUN hg clone https://bitbucket.org/osrf/gazebo_models -b aero_testing_john
RUN cp -r gazebo_models/iris_test ~/.gazebo/models


RUN git clone https://github.com/hsu/ardupilot.git -b gazebo_sitl
WORKDIR /tmp/ardupilot
RUN apt-get update && apt-get install -y gawk
RUN make

RUN apt-get update && apt-get install nvidia-340 --no-install-recommends -y

WORKDIR /tmp
RUN git clone https://github.com/tridge/MAVProxy.git
WORKDIR /tmp/MAVProxy
RUN apt-get update && apt-get install -y python-setuptools
RUN python setup.py build install

RUN cp -r /tmp/gazebo_models/small_2d_gimbal ~/.gazebo/models

ADD entrypoint.sh /entrypoint.sh
ADD runme.bash /runme.bash
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/runme.bash"]
