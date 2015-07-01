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
 


