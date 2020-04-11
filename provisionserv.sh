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

#  echo "install npm"
#  sudo apt-get install -y npm

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
  sudo ln -s $(pwd)/nginx/default /etc/nginx/sites-available/default
  sudo chmod 644 nginx/default
  sudo service nginx restart

  echo "Install packages"
  npm install

  echo "build react static site"
  npm run build

  # clean /var/www
  sudo rm -Rf /var/www

  # symlink /var/www => /vagrant
  sudo ln -s $(pwd)/build /var/www
  
  echo "Setting up api server with pm2"
  PORT=3000 pm2 start -n api npm -- run start:server
  pm2 save
  sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u $USER --hp $HOME
fi
