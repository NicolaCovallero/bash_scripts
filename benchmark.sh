#!/bin/bash
# Benchmark script

_alarm() {
# http://unix.stackexchange.com/questions/1974/how-do-i-make-my-pc-speaker-beep
  ( \speaker-test --frequency $1 --test sine )&
  pid=$!
  \sleep 0.${2}s
  \kill -9 $pid
}

echo "--------Benchmarking script - Kauthan2 -------"

# delete all the .console files - gives time to the user to stop the script 4 seconds 
echo " All the file .console will be deleted - stop the script CTRL-C before it starts (4 seconds)"
t=0
paus=0.4
for i in 1 2 3 4 5 6 7 8 9 10 
do 
	sleep $paus
	t=$(echo $t + $paus | bc) 
	echo "Time elapsed: $t"
done
rm *.console
rm result*
########################

#read -p "Which is the working folder[absolute path]?" folder
~/ros_ws/kautham_ws/devel/lib/kautham2/KauthamConsole -b benchmarking.xml
wait

cp ~/ros_ws/kautham_ws/src/kautham/phyton/kautham_ompl_benchmark_statistics.py "./"

./kautham_ompl_benchmark_statistics.py result_benchmark.log -d result.db
wait
./kautham_ompl_benchmark_statistics.py  -d result.db -p result.pdf
wait

# {
#first arg: frequency (a frequency correpsonds to a different sound)
#second arg: duration
#for i in 1 2 3  
#do 
#	_alarm 600 600
#done
#} &> /dev/null #this, with pararenthesis {} disables the output in the terminal