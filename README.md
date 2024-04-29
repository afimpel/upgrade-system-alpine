# upgrade-system-alpine
Upgrade to Alpine Linux

## terminal version
### version Git.

‼️ All as root or with root permissions. ‼️
```sh
 git clone https://github.com/afimpel/upgrade-system-alpine.git
 cd upgrade-system-alpine/
 cp upgrade-* /usr/bin/
 chmod 777 /usr/bin/upgrade-system* -R
 ```

----

### Version one link.

‼️ All as root or with root permissions. ‼️
```sh
wget  -O - https://raw.githubusercontent.com/afimpel/upgrade-system-alpine/main/installer.sh | sh
```

 ----

### Run
#### ROOT user. 
```sh
upgrade-system
upgrade-system-poweroff
upgrade-system-reboot
```

#### Sudo User.
```sh
sudo upgrade-system
sudo upgrade-system-poweroff
sudo upgrade-system-reboot
```

----

## Desktop
### Version one link.
‼️ All as root or with root permissions. ‼️
 *
```sh
wget  -O - https://raw.githubusercontent.com/afimpel/upgrade-system-alpine/main/installer-desktop.sh | sh
```