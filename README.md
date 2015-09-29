

Build:

    build_docker.bash

Running:
run:

   launch_docker.bash

mavproxy should show up in terminal console
do nothing and wait until you see: `GPS LOCK at 0 meters`

    ~/projects/quadrotor/ardupilot/ArduCopter ~/projects/quadrotor/ardupilot/ArduCopter
    Building sitl
    Reading /home/hsu/projects/quadrotor/ardupilot/config.mk
    // BUILDROOT=/tmp/ArduCopter.build HAL_BOARD=HAL_BOARD_SITL HAL_BOARD_SUBTYPE=HAL_BOARD_SUBTYPE_NONE TOOLCHAIN=NATIVE EXTRAFLAGS=-DGIT_VERSION="458e967d"
    ~/projects/quadrotor/ardupilot/ArduCopter
    Starting up at OSRF0 : 37.4003371,-122.0800351,0,353
    Starting ardupilot : /home/hsu/projects/quadrotor/ardupilot/ArduCopter/ArduCopter.elf -S -I0 --home 37.4003371,-122.0800351,0,353 --model Gazebo --speedup=1
    Connect tcp:127.0.0.1:5760 source_system=255
    Logging to mav.tlog
    MAV>

    Init APM:Copter V3.4-dev (458e967d)

    Free RAM: 4096
    FW Ver: 120
    ----------------------------------------


    load_all took 0us
    0 0 0 online system 1
    STABILIZE> Mode STABILIZE
    APM: APM:Copter V3.4-dev (458e967d)
    APM: Frame: QUAD
    APM: Calibrating barometer
    APM: Initialising APM...
    APM: barometer calibration complete
    Init Gyro**

    Ready to FLY  ublox Received 591 parameters
    fence breach
    APM: PERF: 1/4000 4998 2499

    GPS lock at 0 meters

then, type

    STABILIZE> arm uncheck all
    STABILIZE> arm throttle
    STABILIZE> mode LOITER
    STABILIZE> rc 3 1700

and you should see the vehicle lift off vertically

=== view in apmplanner ===

Now you can use `apmplanner` or `mavproxy` to control the vehicle anyway you like.

=== View in gzclient ===

You can launch `gzclient` locally to watch the simulation too. You'll need a newer gzclient such as version 6. And you will need to copy the models for the `iris_test` and `small_2d_gimbal` models onto your `GAZEBO_MODEL_PATH` such as into ``~/.gazebo/models`
