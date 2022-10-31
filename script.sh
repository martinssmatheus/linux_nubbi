#!/bin/bash

echo "Inicio das instalações"
apt-get update -y && apt-get upgrade -y && apt-get install nano -y

echo "Removendo travas eventuais do apt"
rm /var/lib/dpkg/lock-frontend
rm /var/cache/apt/archives/lock

echo "install APACHE"
apt-get install apache2 -y

echo "Uninstall PHP 8.1"
apt-get autoremove php8.1

echo "Install PHP"
apt install software-properties-common apt-transport-https -y
add-apt-repository ppa:ondrej/php -y
echo deb https://ppa.launchpadcontent.net/ondrej/php/ubuntu jammy main > /etc/apt/sources.list.d/ondrej-ubuntu-php-kinetic.list
apt update -y && apt upgrade -y
apt install php7.4 php7.4-common libapache2-mod-php7.4 php7.4-cli php7.4-symfony-string php7.4-intl -y
service apache2 restart -y

echo "Install workbench"
apt-get install snap -y
apt-get install mysql-server -y
service mysql-server restart -y
snap install mysql-workbench-community

echo "Install discord"
snap install discord

echo "Install spotfy"
snap install spotify 

echo "mksolution"
apt-get install git -y
cd /var/www/html
git clone https://usuarioAWS:senhaAWS@git-codecommit.us-west-2.amazonaws.com/v1/repos/api-mksolutions
cd api-mksolutions
cp api-token.php ../
chmod -R 777 /var/www/html

echo "Install Composer"
cd /var/www/html/api-mksolution
apt-get install composer -y
composer install
composer update

echo "Fininsh"
