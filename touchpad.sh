#!/bin/sh
# script to disable, or enable the touchpad
# to do this launch this command "xinput list" to see the idf of the touchpad,
# in my acer laptop that touchpad has the name:
# SYN1B7E:01 06CB:2970 UNKNOWN              id=13
# and it has the id 13 so:

alias touchpad_enabled='xinput set-prop 13 "Device Enabled" 1'
alias touchpad_disabled='xinput set-prop 13 "Device Enabled" 0'