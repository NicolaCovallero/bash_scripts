#!/bin/sh
#script to initialize all the communication structure with the raspberry

#first unmoun the directory
#fusermount -u ~/raspberry_pi2/filesystem/
sshfs pi@192.168.1.5:/home/pi ~/raspberry_pi2/filesystem/

# access to the raspberry
ssh pi@192.168.1.5

