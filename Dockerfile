FROM ros:humble

RUN sudo apt-get update && sudo apt-get install -y wget python3-pip
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade numpy aiortc
RUN mkdir -p /ros2_ws/src

COPY . /ros2_ws/src/spot_ros2
WORKDIR /ros2_ws/src/spot_ros2
RUN ./install_spot_ros2.sh
WORKDIR /ros2_ws/src
RUN . /opt/ros/humble/setup.sh && colcon build --symlink-install

