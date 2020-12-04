#!/usr/bin/env bash
 
##########
## By: M. Zulfikar
##########

## Check previledge
if [ "$(id -u)" != "0" ]; then  
  echo "This script must be run as ROOT!" 1>&2 # 
  exit 1 
fi  
  
## get current directory
workdir=$(pwd)  

printf "\n==============> User Pass database <==============\n\n"  
## Setup username and password for wordpress database
read -p 'wordpress_db_name [wp_db]: ' wordpress_db_name  
read -p 'db_root_password [only-alphanumeric]: ' -s db_root_password
printf "\n"
read -p 're-enter password: ' -s check
while [[ $db_root_password != $check ]]
do
    printf "\n"
    printf "Wrong password, try again\n"
    read -p 're-enter password: ' -s check
done  

# Set debian frontend to nonineractive
# it's a must if we want to automate apt-get command
export DEBIAN_FRONTEND="noninteractive"  

printf "\n==============> Running update & upgrade <==============\n"
## Update system
apt-get update -y

printf "\n==============> Installing apache2 <==============\n\n"
sudo apt-get install apache2 apache2-utils -y  
sudo systemctl start apache2  
sudo systemctl enable apache2  

printf "\n==============> Installing php <==============\n\n"
apt-get install php libapache2-mod-php php-mysql -y  
  
printf "\n==============> Installing mysql <==============\n\n" 
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $db_root_password"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $db_root_password"
sudo apt-get install mysql-server mysql-client -y 
  
printf "\n==============> Installing wordpress <==============\n\n"  
## Install the latest WordPress
sudo rm /var/www/html/index.*
sudo curl -L http://wordpress.org/latest.tar.gz --output wordpress.tar.gz
sudo tar -xzf wordpress.tar.gz

# Rsync -a to preserve metadata while
# copying file/directory
sudo rsync -a wordpress/* /var/www/html/
  
## Permission
sudo chown -R www-data:www-data /var/www/html/  
sudo chmod -R 755 /var/www/html/  
  
printf "\n==============> Configuring the database <==============\n\n" 
sudo mysql -u root -p$db_root_password <<QUERY_INPUT
CREATE DATABASE $wordpress_db_name;
GRANT ALL PRIVILEGES ON $wordpress_db_name.* TO 'root'@'localhost' IDENTIFIED BY '$db_root_password';
FLUSH PRIVILEGES;
EXIT
QUERY_INPUT

printf "\n==============> Wordpress config credential <==============\n\n"  
## Setup wordpress database config
## replace using stream editor
cd /var/www/html/
sudo mv wp-config-sample.php wp-config.php
sudo sed -i -r "s/database_name_here/$wordpress_db_name/g" wp-config.php
sudo sed -i -r "s/username_here/root/g" wp-config.php
sudo sed -i -r "s/password_here/$db_root_password/g" wp-config.php

## Enabling addtional module to apache and php
sudo a2enmod rewrite  
sudo php5enmod mcrypt

printf "\n==============> Installing phpmyadmin <==============\n\n"  
sudo apt-get install phpmyadmin -y
  
## Configuring PhpMyAdmin
echo 'Include /etc/phpmyadmin/apache.conf' >> /etc/apache2/apache2.conf
  
## Restart apache and mysql service
sudo service apache2 restart  
sudo service mysql restart  
  
## Cleaning up
cd $workdir  
sudo rm -rf wordpress.tar.gz wordpress  
  
printf "\n==============> Installation Completed <==============\n\n"  