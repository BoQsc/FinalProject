#!/bin/sh
sudo dpkg --add-architecture i386 

wget -nc https://dl.winehq.org/wine-builds/Release.key
sudo apt-key add Release.key
sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/

apt-get update
sudo apt-get -y install --install-recommends winehq-devel
