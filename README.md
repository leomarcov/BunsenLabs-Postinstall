![seleccion_827](https://user-images.githubusercontent.com/32820131/40361602-3476698e-5dca-11e8-9aa4-2d91e4e734eb.png)

## BunsenLabs-Postinstall
**`bl-postinstall.sh`**: my personal postinstall scripts, themes and configs for BunsenLabs Helium.  
Althoughs is a collection of my particular useful configs may be interesting for someone.  
The script `bl-postinstall.sh` may exec all actions or only specific list.

### Install
Download the repository or clone it and exec the script `bl-postinstall.sh`
```bash
./bl-postinstall.sh -h
Install configs and themes after BunsenLabs  installation
Usage: bl-postinstall.sh [-h] [-l] [-a <actions>] [-y] [-d]
   -l		Only list actions 
   -a <actions>	Only do selected actions (e.g: -a 5,6,10-15)
   -y		Auto-answer yes to all actions
   -d		Auto-answer default to all actions
   -h		Show this help

# List all actions:
$ ./bl-postinstall.sh -l
[1] Install Google Chrome, add to repositories and set has default browser (y)
[2] Install some useful packages (y)
[3] Install playonlinux and MS Office dependencies (n)
[4] Install rofi and config as default (y)
[5] Install Sublime Text, add repositories and set as default editor  (y)
[6] Install VirtualBox 5.2, add to repositories and insert to Openbox menu (y)
[7] Install VirtualBox Extension Pack (y)
[8] Install script autosnap.sh for autosnap windows with center click in titlebar (y)
[9] Install script ps_mem.py (y)
[10] Install script update-notification.sh (y)
[11] Config bl-exit window with the classic theme (y)
[12] Install new default Conky theme (y)
[13] Install pack of popular fonts (y)
[14] Install Arc GTK theme and set as default (y)
[15] Install Numix-Paper icon theme and set as default (y)
[16] Install clear xfce4-notify theme (y)
[17] Install GoHome Openbox theme and set as default for all users (y)
[18] Install new Terminator themes (y)
[19] Install new tint2 theme (y)
[20] Copy wallpapers pack and set Aptenodytes wallpaper as default (y)
[21] Config new bash prompt (y)
[22] Config useful aliases (y)
[23] Disable some stupid services (y)
[24] Enable CTRL+ALT+BACKSPACE for kill X server (y)
[25] Config system for show messages during boot (y)
[26] Config GRUB for skip menu (y)
[27] Disable lightdm and config login using tty (y)
[28] Config first user account for autologin on lightdm (n)
[29] Config first user account for autologin on tty1 (n)


# Exec all actions:
$ sudo ./bl-postinstall.sh

# Exec all actions and answer yes to all:
$ sudo ./bl-postinstall.sh -y

# Exec all actions and answer default to all:
$ sudo ./bl-postinstall.sh -d

# Exec only actions 5,7,10,11,12,13,14 and 15:
$ sudo ./bl-postinstall.sh -a 5,7,10-15
```
### Customize
The script can be easily customized. 
  * For remove action simply delete the action script file from folder `./postinstall.scripts/`
  * For add action simple add new action script in folder `./postinstall.scripts/` with this header:
  ```
  #!/bin/bash
  # ACTION: Description of the action
  # INFO: Optional aditional info
  # DEFAULT: y
  
  commands to do
  
  ```


</br>

## Autosnap Windows for Openbox
[**`autosnap.sh`**](https://github.com/leomarcov/BunsenLabs-Postinstall/tree/master/autosnap-openbox): script for **autosnap windows** (half-maximice) in Openbox WM.  
The script snap the active windows an choose automatically the corner to snap according the mouse position: if the mouse is in the zone of corner left snap to this quadrant, if is in the center left snap to half left screen, if is in the center maximize the windows, etc.  
It should work in **1 or 2 monitors** (in horizontal).

![peek-12-10-2017-20-43](https://user-images.githubusercontent.com/32820131/40352231-9d64c1fa-5dae-11e8-8137-890cadf2c293.gif)

</br>

## Update Notification for tint 
[**`updagte-notification.sh`**](https://github.com/leomarcov/BunsenLabs-Postinstall/tree/master/update-notification-tint): script that checks periodically APT pending updates and show a notification in tint2 bar using executor plugin (since tint2 0.12.4).  

![seleccion_825](https://user-images.githubusercontent.com/32820131/40354912-55396e4c-5db5-11e8-9b22-aaeedc7e91e3.png)

</br>

## Numix-Paper icon theme
[**`numix-paper-icon-theme.zip`**](https://github.com/leomarcov/BunsenLabs-Postinstall/tree/master/numix-paper-icon-theme): icon theme based completely in symbolics links to Numix and Paper themes.  
The theme can be regenerated by **`numix-paper-icon-theme-sh`**, or modify the script to add others icons.

The theme contains:
  * Folder icons: grey icons from Numix (instead of yellow).
  * Panel icons: panel icons from Paper.
  * Apps icons: apps icons from Paper.
  * Rest come from Numix theme.
  
![numix-paper-icon-theme](https://user-images.githubusercontent.com/32820131/40285580-32b6e22c-5c9e-11e8-8567-01f56d1c12db.png)

</br>

## Neofetch TTY login message
[**`neofetch-tty-login`**](https://github.com/leomarcov/BunsenLabs-Postinstall/edit/master/neofetch-tty-login/README.md): TTY login message is boring. This script show cool info message at login based on neofetch info.
![image](https://user-images.githubusercontent.com/32820131/40976478-92efc988-68ce-11e8-98ec-f5313a773000.png)


</br>

## Brightness control
[**`brightness.sh`**](https://github.com/leomarcov/BunsenLabs-Postinstall/tree/master/brightness-control): script for increase/decrease in small steps.  
```bash
$ ./brightness.sh -h
Inc/dec the brightness
Usage: brightness.sh -inc|-dec|-h|-I|-U
   -h	Show command help
   -def	Set brightness to 30% (may be config in /usr/bin/brightness.sh)
   -inc	Increase the brightness in 5% (may be config in /usr/bin/brightness.sh)
   -dec	Decrease the brightness in 5% (may be config in /usr/bin/brightness.sh)
   -I	Install the script 
