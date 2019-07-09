#!/usr/bin/env bash

sudo apt-get update
echo "Test if node already installed"
if ! hash node 2>/dev/null; then
  echo "Install curl and zip" 
  sudo apt-get -y install curl zip unzip
  
  echo "Setup node source"
  curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
  
  echo "install node"
  sudo apt-get install -y nodejs

  echo "install npm"
  sudo apt-get install -y npm

  echo "install pm2"
  sudo npm install pm2@latest -g
  
  echo "install postgres tools"
  sudo apt-get install -y postgresql-client-common

  echo "install nginx web server"
  sudo apt-get install -y nginx
  sudo ufw allow 'Nginx HTTP'
  sudo service nginx start

  SCRIPTPATH=
  if [ -d "/vagrant" ]; then
    echo 'Switch to project folder if running in Vagrant'
    SCRIPTPATH=/vagrant/
  fi

  echo "update nginx configuration"
  sudo cp -rf ${SCRIPTPATH}nginx/default /etc/nginx/sites-available/default
  sudo chmod 644 /etc/nginx/sites-available/default
  sudo service nginx restart

  # clean /var/www
  sudo rm -Rf /var/www

  # symlink /var/www => /vagrant
  ln -s ${SCRIPTPATH}public /var/www
  
  if [ -d "/vagrant" ]; then
    echo 'Switch to project folder if running in Vagrant'
    cd /vagrant
  fi

  echo "Install packages"
  npm install

  echo "Setting up server with pm2"
  PORT=3000 pm2 start server.js
  pm2 save
  sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u vagrant --hp $HOME
fi