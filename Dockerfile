FROM ubuntu:16.04

ADD ./qtu16/Tools/CMake/ /opt/Qt/Tools/CMake/
ADD ./qtu16/Tools/Ninja/ /opt/Qt/Tools/Ninja/
ADD ./qtu16/5.15.2 /opt/Qt/5.15.2/