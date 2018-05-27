#!/bin/bash
# ACTION: Install playonlinux and some dependencies
# INFO: PlayonLinux is graphical front-end for the Wine for run Windows apps
# DEFAULT: n

# Add i386
dpkg --add-architecture i386
apt-get update

# Install some wine goodies (fonts-wine may wine about dep conflicts, exclude it if it does)
apt-get install -y wine wine32 wine64 libwine libwine:i386 fonts-wine
apt-get install -y wine-bin:i386 winbind
apt-get install -y playonlinux

# Install print libs for printing from Office
sudo apt install libcups2:i386
