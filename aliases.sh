#!/bin/bash
# add this line in the .bashrc "source /path/to/sript/folder/aliases.sh"
# echo "source $(pwd)/aliases.sh" >> ~/.bashrc

# ---------- My alias ---------------------------------------
alias benchmark="~/scripts/benchmark.sh"
alias keyboard_es="setxkbmap -option grp:alt_shift_toggle es"
alias keyboard_it="setxkbmap -option grp:alt_shift_toggle it"
alias touchpad_enabled='xinput set-prop 13 "Device Enabled" 1'
alias touchpad_disabled='xinput set-prop 13 "Device Enabled" 0'
alias init_rasp='~/scripts/init_rasp.sh'
alias access_rasp='ssh pi@192.168.1.3'
alias scan_wifi='sudo arp-scan -l --interface=wlan0'
alias scan_eth='sudo arp-scan -l --interface=eth0'
alias my_qt_creator='sudo qtcreator -stylesheet=/home/nicola/qt-creator/themes/Qt-Creator-Darcula/darcula.css'
alias ipy_notebook='ipython notebook -pylab inline'
alias notebook='jupyter notebook'
alias xpilote_server='~/XPilot/xpilot-ai/xpilots -noQuit +reportToMetaServer -port 1534'
alias android_studio='/usr/local/android-studio/bin/studio.sh'
alias tcp_cd='cd ~/iri_ws/src/iri_table_clearing_planning/'
alias remove_key='~/scripts/remove_key.sh'
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT1'

# gcc default compilation 
# Compile with -Wall options, this suppose the output file
# has the same name of the .c file. The argument to pass is
# the output's name file
gcc_compile_(){
	if [ $# -eq 0 ] 
	then
		echo no argument passed to ${FUNCNAME}"()"
		echo usage: ${FUNCNAME} "<target_name> [-w]"
		return 0
	elif [ $# -gt 1 ]
	then
		if [ "$2" = "-w" ] || [ "$2" = "-W" ]
		then
			command="gcc -Wall -Wmissing-include-dirs -o $1 $1.c"
			echo
			echo "command = $command"
			echo
			$command
			return 0
		else
			echo "too much argument passed, or wrong optional argument given."	
			echo usage: ${FUNCNAME} "<target_name> [-w]"
		fi
	fi
	target=${1}
	# NOTA: target=${1:-ciao} significa che target è uguale al primo
	# argomento, se non esiste il primo argomento allora di default
	# è uguale a ciao(il meno davanti ci va sempre, che sia numeor o no)
	command="gcc -o $target $target.c"
	echo
	echo "command = $command$"
	echo
	$command
}
