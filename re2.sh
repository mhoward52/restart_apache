#!/bin/bash

cd /etc/apache2/sites-available

configFile=( *.conf )

# echo ${#configFile[@]}

# echo "${configFile[@]}"

cd /var/www/restart_apache

if  [[ ! " "${configFile[@]}" " == *" "$1" "* ]]
then
        echo -e "\e[1;5mERROR: \e[0mPass one of the following files as the \e[4mfirst parameter\e[24m following $0 to continue:"
        echo -e "\e[34;43m${configFile[@]}\e[0m"
        exit 1
: '
else
        echo "You are almost there..."
        exit 1
'
fi

CONFIG="$1"
COMMAND="$2"

if [ $# -ne 2 ]
then 
    echo -e "\e[1;5mERROR: \e[0m$0 requires two parameters \e[4m{virtual-host}\e[24m \e[4m{restart|reload}\e[24m"
    exit 1
fi

# only allow reload or restart.
if [ "$COMMAND" == "reload" ] || [ "$COMMAND" == "restart" ]
then
    cd /etc/apache2/sites-available

# Disable vhost
sudo a2dissite "$CONFIG"
sudo service apache2 "$COMMAND"

# Enable
sudo a2ensite "$CONFIG"
sudo service apache2 "$COMMAND"
else
    echo -e "\e[1;5mERROR: \e[0m$COMMAND is an invalid service command \e[1;7m{restart|reload}\e[0m"
    exit 1
fi


