#!/usr/bin/env bash

sudo apt-get update
echo "Test if node already installed"
if ! hash node 2>/dev/null; then
  echo "Install curl and zip" 
  sudo apt-get -y install curl zip unzip
  
  echo "Setup node source"
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  
  echo "install node"
  sudo apt-get install -y nodejs
  
  echo "Switch to project folder"
  cd /vagrant

  echo "Install packages"
  npm install
fi
