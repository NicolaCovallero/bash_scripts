#!/bin/bash
# remove the key associated to a certain pin address given as argument
echo Call with an IP address: remove_key.sh IP_ADDRESS
ssh-keygen -f "/home/nicola/.ssh/known_hosts" -R $1
