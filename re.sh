#!/bin/bash

# Move current execution state to proper dir
cd /etc/apache2/sites-available

# Disable vhost
sudo a2dissite *
sudo service apache2 restart

# Enable
sudo a2ensite *
sudo service apache2 restart
