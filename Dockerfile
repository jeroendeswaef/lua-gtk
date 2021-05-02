FROM debian:buster

# TODO merge into 1 RUN-command to minimise layers

RUN apt-get update && apt-get install -y lua5.3 luarocks

RUN apt-get install -y build-essential 
RUN apt-get install -y libgirepository1.0-dev liblua5.3-dev
RUN apt-get install -y gir1.2-gtk-3.0

RUN luarocks install lgi

RUN  apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module