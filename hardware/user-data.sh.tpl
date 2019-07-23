#!/bin/bash

# Install docker
sudo apt update -y
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update -y
apt-cache policy docker-ce

# Install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Install ansible
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update -y
sudo apt-get install ansible -y
sudo apt-get install python -y

# Install docker-python
sudo apt install python-pip -y
sudo pip install docker-py -y
