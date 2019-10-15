![seleccion_827](https://user-images.githubusercontent.com/32820131/40361602-3476698e-5dca-11e8-9aa4-2d91e4e734eb.png)

# Bunsen config scripts
My personal postinstall scripts, themes and configs for BunsenLabs Helium.  
Althoughs is a collection of my particular configs may be interesting for someone.  
The script `install` may exec all actions or only specific list.

## Install
Download or clone the repository and exec script `install`
```
$ ./install -h
Install configs and themes scripts in BunsenLabs 
Usage: install [-h] [-l] [-a <actions>] [-y] [-d]
   -l		Only list actions 
   -a <actions>	Only do selected actions (e.g: -a 5,6,10-15)
   -y		Auto-answer yes to all actions
   -d		Auto-answer default to all actions
   -h		Show this help


# List all actions:
$ ./install -l
[1] Config first user account for autologin on lightdm (n)
[2] Config first user account for autologin on tty1 (n)
[3] Config useful aliases (y)
[4] Config new bash prompt (y)
[5] Config system for show messages during boot (y)
[6] Config some stupid services for not start during boot (y)
[7] Config GRUB with password for prevent users edit entries (y)
[8] Config GRUB for skip menu (y)
[9] Config CTRL+ALT+BACKSPACE shortcut for kill X server (y)
[10] Config Thunar for show toolbar and double-click for active items (y)
[11] Config vim with custom configs (y)
[12] Install Atom text editor (y)
[13] Install Brave browser, add to repositories and set has default browser (y)
[14] Install Google Chrome, add to repositories and set has default browser (y)
[15] Install playonlinux and MS Office dependencies (n)
[16] Install script ps_mem.py (y)
[17] Install rofi and config as default (y)
[18] Install some useful packages (y)
[19] Install Sublime Text, add repositories and set as default editor  (y)
[20] Install VirtualBox 6.0 and Extension Pack, add to repositories and insert to Openbox menu (y)
[21] Install xfce4-clipman (allow screenshot to clipboard) and replace for clipit (y)
[22] Remove bunsen-welcome autostart script  (y)
[23] Install script poweroff_last for automatize shutdown if no users logged in 20 minutes (y)
[24] Install script autosnap for autosnap windows with double click in titlebar (y)
[25] Install script brightness (y)
[26] Config text mode login using tty instead of lightdm display manager (y)
[27] Install script update-notification (y)
[28] Install theme Arc GTK and set as default (y)
[29] Config theme bl-exit with the classic theme (y)
[30] Install theme Conky with new theme (y)
[31] Install pack of popular fonts (y)
[32] Install clear xfce4-notify theme (y)
[33] Install icon theme Numix-Paper and set as default (y)
[34] Install theme GoHome for Openbox and set as default for all users (y)
[35] Install new Terminator themes (y)
[36] Install new tint2 theme (y)
[37] Copy wallpapers pack and set Aptenodytes wallpaper as default (y)


# Exec all actions interactively:
$ sudo ./install

# Exec all actions and answer yes to all:
$ sudo ./install -y

# Exec all actions and answer default to all:
$ sudo ./install -d

# Exec only actions 5,7,10,11,12,13,14 and 15:
$ sudo ./install -a 5,7,10-15
```

### Customize
The script can be easily customized. Each action script `.sh` placed in a subdirectory are automatillacy recognized by `install`.
  * For remove action simply delete the action directory.
  * For add action simply add new folder and place the install script `.sh` and dependences. The script must have this header:
  ```
  #!/bin/bash
  # ACTION: Description of the action
  # INFO: Optional aditional info
  # DEFAULT: y
  
  commands to do
  
  ```
</br>


## Autosnap Windows for Openbox
[**`autosnap`**](https://github.com/leomarcov/bunsenlabs-postinstall/tree/master/script_autosnap-openbox): script for **autosnap windows** (half-maximice) in Openbox WM.  
The script snap the active windows an choose automatically the corner to snap according the mouse position: if the mouse is in the zone of corner left snap to this quadrant, if is in the center left snap to half left screen, if is in the center maximize the windows, etc.  
It should work in **1 or 2 monitors** (in horizontal).

![peek-12-10-2017-20-43](https://user-images.githubusercontent.com/32820131/40352231-9d64c1fa-5dae-11e8-8137-890cadf2c293.gif)

</br>

## Update Notification for tint 
[**`update-notification`**](https://github.com/leomarcov/bunsenlabs-postinstall/tree/master/script_update-notification-tint): script that checks periodically APT pending updates and show a notification in tint2 bar using executor plugin (since tint2 0.12.4).  

![seleccion_825](https://user-images.githubusercontent.com/32820131/40354912-55396e4c-5db5-11e8-9b22-aaeedc7e91e3.png)

</br>

## Numix-Paper icon theme
[**`numix-paper-icon-theme.zip`**](https://github.com/leomarcov/bunsenlabs-postinstall/tree/master/theme_numix-paper-icon): icon theme based completely in symbolics links to Numix and Paper themes.  
The theme can be regenerated by **`numix-paper-icon-theme-sh`**, or modify the script to add others icons.

The theme contains:
  * Folder icons: grey icons from Numix (instead of yellow).
  * Panel icons: panel icons from Paper.
  * Apps icons: apps icons from Paper.
  * Rest come from Numix theme.
  
![numix-paper-icon-theme](https://user-images.githubusercontent.com/32820131/40285580-32b6e22c-5c9e-11e8-8567-01f56d1c12db.png)

</br>

## Neofetch TTY login message
[**`neofetch-tty-login`**](https://github.com/leomarcov/bunsenlabs-postinstall/tree/master/script_tty-login-neofetch): TTY login message is boring. This script show cool info message at login based on neofetch info.
![image](https://user-images.githubusercontent.com/32820131/40976478-92efc988-68ce-11e8-98ec-f5313a773000.png)


</br>

## Brightness control
[**`brightness`**](https://github.com/leomarcov/bunsenlabs-postinstall/tree/master/script_brightness-control): script for increase/decrease in small steps.  
```bash
$ ./brightness.sh -h
Inc/dec the brightness
Usage: brightness.sh -inc|-dec|-h|-I|-U
   -h	Show command help
   -def	Set brightness to 30% (may be config in /usr/bin/brightness.sh)
   -inc	Increase the brightness in 5% (may be config in /usr/bin/brightness.sh)
   -dec	Decrease the brightness in 5% (may be config in /usr/bin/brightness.sh)
   -I	Install the script 
