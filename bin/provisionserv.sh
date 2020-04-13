#!/usr/bin/env bash

sudo apt-get update
echo "Test if node already installed"
if ! hash node 2>/dev/null; then
  echo "Install curl and zip" 
  sudo  DEBIAN_FRONTEND=noninteractive apt-get -y install curl zip unzip
  
  echo "Setup node source"
  curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
  
  echo "install node"
  sudo apt-get install -y nodejs

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
    echo 'cd /vagrant' >> $HOME/.profile
    cd /vagrant
  fi

  echo "update nginx to point to local configuration"
  sudo rm /etc/nginx/sites-available/default
  sudo ln -s $(pwd)/web/default /etc/nginx/sites-available/default
  sudo chmod 644 web/default
  sudo service nginx restart

  echo "Install packages"
  cd api
  npm install
  cd ../app
  echo "build react static site"
  npm install
  npm run build
  cd ..

  echo "Generate secure key"
  ssh-keygen -q -N '' -f ~/.ssh/id_rsa 2>/dev/null <<< y >/dev/null

  echo "Set up DBPASS variable"
  echo "export DBPASS=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)" > /home/vagrant/dbpass.sh
  source /home/vagrant/dbpass.sh
fi
