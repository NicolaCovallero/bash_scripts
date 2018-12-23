#!/bin/bash
# how include other script

# call another script
my_dir="$(dirname "$0")"
"$my_dir/beep_noise.sh"


sleep 2
printf "new sound\n"

# include script
source $(dirname $0)/beep_noise.sh
{
_alarm 400 200
} &> /dev/null