#!/bin/bash
# ACTION: Install rofi and config as default
# INFO: Rofi is a simple text switcher and launcher
# DEFAULT: y

if [ $(apt-cache pkgnames | grep "^rofi$" | wc -l) -eq 0 ]; then
	echo "ERROR: cant find rofi in repositories"
	exit 1
fi

base_dir="$(dirname "$(dirname "$(readlink -f "$0")")")"
apt-get install -y rofi
	
for d in /usr/share/bunsen/skel/.config/  /home/*/.config/; do
	[ ! -d "$d/rofi/" ] && mkdir -p "$d/rofi/"
	# Set defaul theme: android:notification:
	echo '#include "/usr/share/rofi/themes/android_notification.theme"' > "$d/rofi/config"
	
	# Copy rc.xml config with shortkeys for rofi
	cp -v "$base_dir/postinstall-files/rc.xml" "$d/openbox/"
	
	# Set as runas in menu:
	sed -zi 's/<command>[[:blank:]]*\n[[:blank:]]*gmrun[[:blank:]]*\n[[:blank:]]*<\/command>/<command>rofi -show drun<\/command>/' "$d/openbox/menu.xml"
done
