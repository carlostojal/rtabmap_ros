FROM ros:noetic

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y ros-noetic-rtabmap ros-noetic-rtabmap-ros

RUN mkdir -p /rtabmap_ros/build
COPY . /rtabmap_ros

WORKDIR /rtabmap_ros/build
RUN . /opt/ros/noetic/setup.sh; cmake ..
RUN . /opt/ros/noetic/setup.sh; make -j6
RUN . /opt/ros/noetic/setup.sh; make install

