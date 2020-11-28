#!/usr/bin/env bash
# shebang diatas dinilai lebih aman jika script dibuat untuk kompatibel dengan distro lain, karena menggunakan bash yang teratur dalam environment variabel terminal

# Menjalankan update dan upgrade
printf "\n==============> Running update & upgrade <==============\n"

sudo apt-get -y update && sudo apt-get -y dist-upgrade

# Instalasi git
printf "\n==============> Installing git <==============\n\n"

sudo apt-get -y install git

# Instalasi apache2
printf "\n==============> Installing apache2 <==============\n\n"

sudo apt-get -y install apache2

# Pengaturan firewall (optional)
printf "\n==============> Enabling firewall <==============\n\n"

# sudo ufw app list (melihat aplikasi yang dapat diatur)
sudo ufw allow 'Apache'

# Pengaturan direktori root apache2
printf "\n==============> Deploying Webapp <==============\n\n"
cd /var/www

# Clone repository github
sudo git clone https://github.com/mohzulfikar/webapp.git

# Mengganti direktori root apache2 dari /var/www/html menjadi /var/www/webapp dan melakukan restart apache2
printf "\n==============> Renaming default apache2 configuration <==============\n\n"

sudo sed -i -r 's/\/html/\/webapp/g' /etc/apache2/sites-available/000-default.conf 
sudo /etc/init.d/apache2 restart

# Script selesai dan vm siap untuk digunakan
printf "\n==============> Automation Complete <==============\n\n"
