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

# APACHE - PHP5 with cli, mcrypt, intl, xdebug, libapache2, gd, imagick, PDO: mysql, sybase, sqlite, pgsql
sudo apt-get install -y apache2 php5 php5-cli php5-mcrypt php5-intl php5-xdebug libapache2-mod-auth-mysql php5-mysql php5-sybase php5-sqlite php5-pgsql php5-gd php5-imagick

# APACHE settings
# servername
echo "ServerName devvm" | sudo tee /etc/apache2/conf-available/fqdn.conf
sudo a2enconf fqdn
# mod rewrite
sudo a2enmod rewrite
# Add vagrant user to www-data group
sudo usermod -a -G www-data vagrant
# Change localhost dir
sudo sed -i 's#DocumentRoot /var/www/html#DocumentRoot /vagrant/workspaces \n     <Directory /vagrant/workspaces> \n          Options +Indexes +FollowSymLinks +MultiViews \n          AllowOverride All \n          Require all granted \n          Order allow,deny \n          allow from all \n     </Directory>#' /etc/apache2/sites-available/000-default.conf
sudo sed -i 's#DocumentRoot /var/www/html#DocumentRoot /vagrant/workspaces \n     <Directory /vagrant/workspaces> \n          Options +Indexes +FollowSymLinks +MultiViews \n          AllowOverride All \n          Require all granted \n          Order allow,deny \n          allow from all \n     </Directory>#' /etc/apache2/sites-enabled/000-default.conf

# PHP 5 settings
#mod mcrypt
sudo php5enmod mcrypt
sudo php5enmod intl
# error_reporting
sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/cli/php.ini
sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/apache2/php.ini
sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/apache2/php.ini 
sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/cli/php.ini

# Set Sybase freetds.conf protocol
sudo sed -i 's/# TDS protocol version/# TDS protocol version \n        tds version = 5.0 \n /' /etc/freetds/freetds.conf 

# INSTALL COMPOSER
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
# self-update every week
crontab -l | { cat; echo "0 0 */7 * * composer self-update"; } | crontab -

sudo service apache2 restart
