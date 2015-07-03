#!/bin/bash

# angularagrant
#
# author: Ademir Mazer Jr <ademir.mazer.jr@gmail.com
# url: https://github.com/nunomazer/angularagrant


# NODE.JS
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C7917B12
sudo sh -c 'echo "deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu trusty main" >> /etc/apt/sources.list.d/nodejs.list'

sudo apt-get update

# INSTALL Node.js node - recess - gulp - bower
sudo apt-get install -y nodejs
sudo npm install -g recess
sudo npm install -g gulp
sudo npm install -g bower
 
# INSTALL GIT
sudo apt-get install -y git

# APACHE - PHP5 with mcrypt, intl, xdebug, libapache2, PDO: mysql, sybase
sudo apt-get install -y apache2 php5 php5-cli php5-mcrypt php5-intl php5-xdebug libapache2-mod-auth-mysql php5-mysql php5-sybase php5-sqlite php5-pgsql

# APACHE servername
echo "ServerName devvm" | sudo tee /etc/apache2/conf-available/fqdn.conf
sudo a2enconf fqdn

# APACHE mod rewrite
sudo a2enmod rewrite

# PHP 5 mod mcrypt
sudo php5enmod mcrypt
sudo php5enmod intl

# Set Sybase freetds.conf protocol
sudo sed -i 's/# TDS protocol version/# TDS protocol version \n        tds version = 5.0 \n /' /etc/freetds/freetds.conf 

sudo service apache2 restart
