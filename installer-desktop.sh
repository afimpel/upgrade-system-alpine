#!/bin/bash
wget  -O - https://raw.githubusercontent.com/afimpel/upgrade-system-alpine/main/installer.sh | sh
mkdir -p /usr/share/pixmaps/
mkdir -p /usr/share/applications/

curl -L https://raw.githubusercontent.com/afimpel/upgrade-system-alpine/desktop/pkexec_upgrade-system > /usr/bin/pkexec_upgrade-system
curl -L https://raw.githubusercontent.com/afimpel/upgrade-system-alpine/desktop/pkexec_upgrade-system-poweroff > /usr/bin/pkexec_upgrade-system-poweroff
curl -L https://raw.githubusercontent.com/afimpel/upgrade-system-alpine/desktop/pkexec_upgrade-system-reboot > /usr/bin/pkexec_upgrade-system-reboot

curl -L https://raw.githubusercontent.com/afimpel/upgrade-system-alpine/desktop/Desktop/gksu_upgrade.desktop > /usr/share/applications/gksu_upgrade.desktop
curl -L https://raw.githubusercontent.com/afimpel/upgrade-system-alpine/desktop/Desktop/gksu_poweroff.desktop > /usr/share/applications/gksu_poweroff.desktop
curl -L https://raw.githubusercontent.com/afimpel/upgrade-system-alpine/desktop/Desktop/gksu_reboot.desktop > /usr/share/applications/gksu_reboot.desktop

curl -L https://raw.githubusercontent.com/afimpel/upgrade-system-alpine/desktop/Desktop/upgrade.png > /usr/share/pixmaps/upgrade.png
curl -L https://raw.githubusercontent.com/afimpel/upgrade-system-alpine/desktop/Desktop/shutdown.png > /usr/share/pixmaps/shutdown.png
curl -L https://raw.githubusercontent.com/afimpel/upgrade-system-alpine/desktop/Desktop/reboot.png > /usr/share/pixmaps/reboot.png

chmod 777 /usr/share/applications/gksu_*
chmod 777 /usr/share/pixmaps/* -R
chmod 777 /usr/bin/pkexec_upgrad* -R
