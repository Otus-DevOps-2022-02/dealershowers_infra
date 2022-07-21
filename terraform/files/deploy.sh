#!/bin/bash
echo "#############################"
echo "#      set -e APP_DIR       #"
echo "#############################"
set -e
APP_DIR=${1:-$HOME}

echo "#############################"
echo "#    apt update upgrade     #"
echo "#############################"

# sudo apt upgrade
sleep 25

echo "#############################"
echo "#      apt install git      #"
echo "#############################"

sudo apt install -y git
sleep 25
echo "################################"
echo "# git clone and install reddit #"
echo "################################"
git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit
cd $APP_DIR/reddit
bundle install
sleep 13
sudo mv /tmp/puma.service /etc/systemd/system/puma.service

echo "################################"
echo "#          start puma          #"
echo "################################"
sudo systemctl start puma
sudo systemctl enable puma
