#!/bin/bash
#===================================================================================
# Shutdown machine if userr logged now and in last minutes in first parameter
# AUTHOR: Leonardo Marco
# CREATED: 2018.06.07
#===================================================================================

install_path="/usr/bin/poweroff_last.sh"     # Installation dir


function try_poweroff() {
  mins="$1"
  
  # Exit if someone is logged
  [ "$(who | wc -l)" -gt 0 ] && exit 

  # Exit if someone was logged 20min ago
  [ $(last -s -${mins}min | grep -Ev 'reboot|wtmp|^$' | wc -l) -gt 0 ] && exit

  # Poweroff the machine
  shutdown -h now

  exit
}


function install() {
  mins="$1"
  [ "$(id -u)" -ne 0 ] && echo "Install must be run as root" && exit 1
  [ "$install_path" = "$(readlink -f $0)" ] || sudo cp -v "$0" "$install_path"
  chmod +x "$install_path"

  (crontab -l 2>/dev/null; echo "*/$mins * * * *   $install_path $mins   #$(basename $0)") | crontab - 

  exit 
}

function uninstall() {
  rm -v "$install_path"
  crontab -l | grep -v "#$(basename $0)" | crontab -

  exit 
}


function help() {
	echo -e 'Shutdown machine if nobody is logged since minutes in first parameter.
Usage: '$(basename $0)' mins | -I mins
   \e[1mmins\e[0m     Try shutdown if no users logged now and in last \e[1mmins\e[0m minutes
   \e[1m-I mins\e[0m  Install the script (copy and program cron every \e[1mmins\e[0m minutes
   \e[1m-U mins\e[0m  Uninstall the script
'
	exit
}


# ACTIONS
[ "$1" = "-U" ] && uninstall
[ "$1" = "-I" ] && [ "$2" -eq "$2" ] &>/dev/null && install "$2"
[ "$1" -eq "$1" ] && try_poweroff "$1"
help
