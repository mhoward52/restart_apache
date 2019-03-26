#!/bin/bash

CONFIG="$1"
COMMAND="$2"

if [ $# -ne 2 ]
then
    echo "$0 requires two parameters {virtual-host} {restart|reload}"
    exit 1
fi

# only allow reload or restart.
if [ "$COMMAND" == "reload" ] || [ "$COMMAND" == "restart" ]
then
    cd /etc/apache2/sites-available

# Disable vhost
sudo a2dissite "$CONFIG"
sudo service apache2 restart "$COMMAND"

# Enable
sudo a2ensite "$CONFIG"
sudo service apache2 restart "$COMMAND"
else
    echo "ERROR: $COMMAND is an invalid service command {restart|reload}"
    exit 1
fi


