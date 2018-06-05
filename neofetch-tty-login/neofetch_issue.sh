#!/bin/bash
clear > /etc/issue
echo -e "\e[90m\l\e[0m">> /etc/issue
neofetch --config /usr/share/neofetch/config_tty >> /etc/issue
sed -i -z 's/\n\n\n/ /g'   /etc/issue 	# Sometimes neofetch add extra \n

# Pending updates
updates=$(wc -l /var/cache/update-notification 2>/dev/null | cut -f1 -d" ")
[ "$updates" -gt 0 ] &>/dev/null && sed -i "/Packages/ s/$/($updates pending updates)/" /etc/issue

# Add iface to local ip
iface=$(ip route get 8.8.8.8 | awk '{print $5}')
sed -i "/Local IP/ s/$/($iface)/" /etc/issue

# Show users:
echo -en "\e[1mUsers\e[0m: " >> /etc/issue
for u in $(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | tac); do 
	# Red if lock user:
	[ "$(passwd -S $u | cut -f2 -d" ")" = "L" ] && echo -en "\e[91m" >> /etc/issue
	# Mark sudo users:
	grep -Po '^sudo.+:\K.*$' /etc/group | grep -w "$u" &>/dev/null && u="${u}*"
	
	echo -en "$u\e[0m  " >> /etc/issue
done
echo >> /etc/issue 
