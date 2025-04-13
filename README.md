# upgrade-system-alpine
Update to Alpine Linux, to perform a series of commands to make it more user friendly.

## Desktop
‼️ All as root. ‼️

### Version one link.
* open terminal favorite
* login as root
* copy and paste command below

```bash
wget --no-cache -O - https://raw.githubusercontent.com/afimpel/upgrade-system-alpine/main/installer-desktop.sh | sh
```
----


## terminal version
‼️ All as root. ‼️

### Version one link.
* open terminal favorite
* login as root
* copy and paste command below

```bash
wget --no-cache -O - https://raw.githubusercontent.com/afimpel/upgrade-system-alpine/main/installer.sh | sh
```
----
### version Git.
‼️ All as root. ‼️
* open terminal favorite
* login as root
* Copy and paste the commands below step by step without skipping any steps.

```bash
 git clone https://github.com/afimpel/upgrade-system-alpine.git
 cd upgrade-system-alpine/
 cp upgrade-* /usr/bin/
 cp package-up* /usr/bin/
 chmod 777 /usr/bin/upgrade-system* -R
 chmod 777 /usr/bin/package-up* -R
 apk add sudo bash wget curl
 echo "%wheel ALL=(ALL:ALL) ALL" > /etc/sudoers.d/wheel
 echo "%wheel ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown, /usr/bin/upgrade-syste*, /usr/bin/package-update" >> /etc/sudoers.d/wheel
 adduser $(getent passwd 1000 | cut -d: -f1) wheel
 ```
‼️ Important remember that this GIT method is for terminal use only. ‼️
----
# Terminal usage mode.

## Run
### ROOT user. 
```sh
package-update
upgrade-system
upgrade-system-poweroff
upgrade-system-reboot
```

### Sudo User.
```sh
sudo package-update
sudo upgrade-system
sudo upgrade-system-poweroff
sudo upgrade-system-reboot
```