#!/bin/bash
URLgithub="https://raw.githubusercontent.com/afimpel/upgrade-system-debian"
mkdir -p /usr/share/pixmaps/
mkdir -p /usr/share/applications/

wget --no-cache -O /usr/bin/pkexec_upgrade-system ${URLgithub}/desktop/pkexec_upgrade-system
wget --no-cache -O /usr/bin/pkexec_upgrade-system-poweroff ${URLgithub}/desktop/pkexec_upgrade-system-poweroff
wget --no-cache -O /usr/bin/pkexec_upgrade-system-reboot ${URLgithub}/desktop/pkexec_upgrade-system-reboot

wget --no-cache -O /usr/share/applications/gksu_upgrade.desktop ${URLgithub}/desktop/Desktop/gksu_upgrade.desktop
wget --no-cache -O /usr/share/applications/gksu_poweroff.desktop ${URLgithub}/desktop/Desktop/gksu_poweroff.desktop
wget --no-cache -O /usr/share/applications/gksu_reboot.desktop ${URLgithub}/desktop/Desktop/gksu_reboot.desktop

wget --no-cache -O /usr/share/pixmaps/upgrade.png ${URLgithub}/desktop/Desktop/upgrade.png
wget --no-cache -O /usr/share/pixmaps/poweroff.png ${URLgithub}/desktop/Desktop/poweroff.png
wget --no-cache -O /usr/share/pixmaps/reboot.png ${URLgithub}/desktop/Desktop/reboot.png

chmod 777 /usr/share/applications/gksu_*
chmod 777 /usr/share/pixmaps/* -R
chmod 777 /usr/bin/pkexec_upgrad* -R
