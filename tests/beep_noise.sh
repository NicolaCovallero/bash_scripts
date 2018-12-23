#!/bin/bash

_alarm() {
# http://unix.stackexchange.com/questions/1974/how-do-i-make-my-pc-speaker-beep
  ( \speaker-test --frequency $1 --test sine )&
  pid=$!
  \sleep 0.${2}s
  \kill -9 $pid
}

{
#first arg: frequency (a frequency correpsonds to a different sound)
#second arg: duration
for i in 1 2 3  
do 
	_alarm 600 600
done
} &> /dev/null #this, with pararenthesis {} disables the output in the terminal