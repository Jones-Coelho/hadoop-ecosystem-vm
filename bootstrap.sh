#!/bin/bash
sudo apt-get upgrade
sudo apt-get update
sudo apt-get install docker.io -y
sudo docker pull cloudera/quickstart:latest
sudo docker run --hostname=quickstart.cloudera --privileged=true -t -i -d -p 8888:8888 -p 7180:7180 -p 3306:3306 cloudera/quickstart /usr/bin/docker-quickstart