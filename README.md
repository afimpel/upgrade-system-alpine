# upgrade-system-alpine
Upgrade to Alpine Linux

## terminal version
### version Git.

‼️ All as root. ‼️
```sh
 git clone https://github.com/afimpel/upgrade-system-alpine.git
 cd upgrade-system-alpine/
 cp upgrade-* /usr/bin/
 cp check-pa* /usr/bin/
 chmod 777 /usr/bin/upgrade-system* -R
 chmod 777 /usr/bin/check-pa* -R
 ```

----

### Version one link.

‼️ user with root permissions (sudo). ‼️
```sh
wget --no-cache -O - https://raw.githubusercontent.com/afimpel/upgrade-system-alpine/main/installer.sh | sudo sh
```

 ----

### Run
#### ROOT user. 
```sh
check-package
upgrade-system
upgrade-system-poweroff
upgrade-system-reboot
```

#### Sudo User.
```sh
sudo check-package
sudo upgrade-system
sudo upgrade-system-poweroff
sudo upgrade-system-reboot
```

----

## Desktop
### Version one link.
‼️ user with root permissions (sudo). ‼️
 *
```sh
wget --no-cache -O - https://raw.githubusercontent.com/afimpel/upgrade-system-alpine/main/installer-desktop.sh | sudo sh
```