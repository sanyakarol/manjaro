#!/bin/bash 
set -o errexit

# set battery
battery=$(ls /sys/class/power_supply/ | grep '^BAT')

# set full path
acpi_path="/sys/class/power_supply/$battery"

# get battery status and capacity
stat=$(cat $acpi_path/status)
percent=$(cat $acpi_path/capacity)

if [ "$stat" == "Discharging" ]; then
  if   [ $percent -le 2  ]; then
    systemctl suspend;
  elif [ $percent -le 10  ]; then   
       dunstify "LOW POWER"
  elif [ $percent -le 15 ]; then   
    dunstify "LOW POWER"
  fi
fi
