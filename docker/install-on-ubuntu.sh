#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

if ! [ -f $HOME/.dockerInstalled ]; then
    # Install Docker
    sudo apt-get update -fy
    yes | sudo apt-get install -fy \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"
    sudo apt-get update -fy
    yes | sudo apt-get install -fy docker-ce

    # Install Docker Compose
    sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    docker-compose --version

    touch $HOME/.dockerInstalled
fi
