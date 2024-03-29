#!/bin/bash
apk add nano git mc bash zsh htop neofetch curl btop sudo
echo "%wheel ALL=(ALL:ALL) ALL" > /etc/sudoers.d/wheel
echo "%wheel ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown, /usr/bin/upgrade-syste*" >> /etc/sudoers.d/wheel
sed -i 's/\/bin\/ash/\/bin\/bash/g' /etc/passwd
curl -L https://raw.githubusercontent.com/afimpel/upgrade-system-alpine/main/upgrade-system > /usr/bin/upgrade-system
curl -L https://raw.githubusercontent.com/afimpel/upgrade-system-alpine/main/upgrade-system-poweroff > /usr/bin/upgrade-system-poweroff
curl -L https://raw.githubusercontent.com/afimpel/upgrade-system-alpine/main/upgrade-system-reboot > /usr/bin/upgrade-system-reboot
chmod 777 /usr/bin/upgrade-system* -R