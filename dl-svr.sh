#!/bin/bash

sudo apt-get -y install dirmngr
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BC359FFF5A04B56C41DBC134289CABAB043F53A7
sudo add-apt-repository ppa:kartkrew/srb2kart -y
sudo apt-get update
sudo apt-get -y install srb2kart

