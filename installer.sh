#!/bin/sh
# Reset
UUID=$(id -u)
UUID=$(( UUID + 0 ))
I_OK="✔"
I_KO="✖️"

if [ $UUID != 0 ]; then
    echo "${I_KO}    Start the Script as 'root' for it to work properly    ${I_KO}";
    exit 1;
else
    URLgithub="https://raw.githubusercontent.com/afimpel/upgrade-system-alpine"
    apk add nano git mc bash sudo
    echo "%wheel ALL=(ALL:ALL) ALL" > /etc/sudoers.d/wheel
    echo "%wheel ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown, /usr/bin/upgrade-syste*" >> /etc/sudoers.d/wheel
    adduser $(getent passwd 1000 | cut -d: -f1) wheel

    wget --no-cache -O /usr/bin/upgrade-system ${URLgithub}/main/upgrade-system
    wget --no-cache -O /usr/bin/upgrade-system-poweroff ${URLgithub}/main/upgrade-system-poweroff
    wget --no-cache -O /usr/bin/upgrade-system-reboot ${URLgithub}/main/upgrade-system-reboot

    chmod 777 /usr/bin/upgrade-system* -R
fi