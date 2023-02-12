#!/bin/bash

echo "*** Adding hosts ..."
echo "192.168.34.100 docker.martin.bg docker" >> /etc/hosts

echo "*** Adding Docker repository ..."
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
  
echo "*** Update base image & installing Docker ..."
sudo dnf update -y && dnf install -y docker-ce docker-ce-cli containerd.io
  
echo "*** Enable and Start Docker deamon and configuring it to start on boot ..."
sudo systemctl enable docker
sudo systemctl start docker

echo "*** Check docker status ..."
sudo systemctl status docker

echo "*** Enable vagrant user to properly use the docker commands without using sudo for every command ..."
sudo usermod -aG docker vagrant
  
echo "*** Firewall - open http service port ..."
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload

echo "*** Copy files ..."
cp /vagrant/index.html /vagrant/Dockerfile /home/vagrant

echo "*** Building docker image ..."
docker image build -t httpd-docker-image .
echo "*** Running container from created docker image ..."
docker container run -d -p 8080:80 httpd-docker-image
echo "*** Check running docker container/s ..."
docker container ls
