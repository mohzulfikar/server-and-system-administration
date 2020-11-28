#!/usr/bin/env bash
# shebang in env is considered safer for compatibility among other distro(s)

# Running update and upgrade
printf "\n==============> Running update & upgrade <==============\n"

sudo apt-get -y update && sudo apt-get -y dist-upgrade

# Installing git
printf "\n==============> Installing git <==============\n\n"

sudo apt-get -y install git

# Installing apache2
printf "\n==============> Installing apache2 <==============\n\n"

sudo apt-get -y install apache2

# firewall config (optional)
printf "\n==============> Enabling firewall <==============\n\n"

# sudo ufw app list # (to view list of aplication that can be configured)
sudo ufw allow 'Apache'

# Setup apache2 root directory
printf "\n==============> Deploying Webapp <==============\n\n"
cd /var/www

# Clone github repository
sudo git clone https://github.com/mohzulfikar/webapp.git

# Change apache2 root directory from /var/www/html to /var/www/webapp and restart apache2
printf "\n==============> Renaming default apache2 configuration <==============\n\n"

sudo sed -i -r 's/\/html/\/webapp/g' /etc/apache2/sites-available/000-default.conf 
sudo /etc/init.d/apache2 restart

# Script is completed and web app is already served
printf "\n==============> Automation Complete <==============\n\n"
