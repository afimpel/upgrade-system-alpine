#!/bin/bash
# Reset
UUID=$(id -u)
UUID=$(( UUID + 0 ))
I_OK="✔"
I_KO="X"
NC='\e[0m'

Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

# High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[0;105m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White

R1 () {
    data=$(completeLine "$2" "$5" 1);
    printf " ${3}$4 ${NC}$1 $data ${3}$4${NC}\n"
}

CUSTOM () {
    data=$(completeLine "$2" "$7" 3 "$4" $9);
    printf " ${5}$6 ${NC}$1 $2$3 $data ${5}$8${NC}\n"
}

L1 () {
    data=$(completeLine "$2" "$5" 2);
    printf " ${3}$4 ${NC}$1 $data ${3}$4${NC}\n"
}

completeLine() {
    if [ "$3" == '3' ]; then
        menos=$(( 9 + $5 ))
    else
        menos=8
    fi
    local input_string="$1$4"
    local input_string0="$1"
    local input_string1="$4"
    local total_length=$(tput cols)-$menos
    local input_length=${#input_string}
    local num_dots=$((total_length - input_length))

    if [ $num_dots -lt 0 ]; then
        num_dots=1
    fi

    local output_string=""
    for ((i=0; i<num_dots; i++)); do
        output_string+="$2"
    done
    if [ "$3" == '3' ]; then
        echo "$output_string $input_string1"
    elif [ "$3" == '0' ]; then
        echo "$input_string0 $output_string $input_string1"
    elif [ "$3" == '1' ]; then
        echo "$input_string $output_string"
    else
        echo "$output_string $input_string"
    fi
}
if [ $UUID != 0 ]; then
    CUSTOM $Red "Start the Script as ROOT for it to work properly" $IRed "${USER^^}" $BIRed "✘" "." "✘" 0
    exit 1;
else
    users=$(getent passwd 1000 | cut -d: -f1)
    CUSTOM $Yellow "Launched" $IYellow "${users}" $BIYellow "▶" "." "▶" 0
    URLgithub="https://raw.githubusercontent.com/afimpel/upgrade-system-alpine"

    wget --no-cache -O - ${URLgithub}/main/installer.sh | sh
    apk add xterm xdotool wmctrl
    mkdir -p /usr/share/pixmaps/
    mkdir -p /usr/share/applications/

    wget --no-cache -O /usr/bin/pkexec_upgrade-system ${URLgithub}/main/pkexec_upgrade-system
    wget --no-cache -O /usr/bin/pkexec_upgrade-system-poweroff ${URLgithub}/main/pkexec_upgrade-system-poweroff
    wget --no-cache -O /usr/bin/pkexec_upgrade-system-reboot ${URLgithub}/main/pkexec_upgrade-system-reboot

    wget --no-cache -O /usr/share/applications/gksu_upgrade.desktop ${URLgithub}/main/Desktop/gksu_upgrade.desktop
    wget --no-cache -O /usr/share/applications/gksu_poweroff.desktop ${URLgithub}/main/Desktop/gksu_poweroff.desktop
    wget --no-cache -O /usr/share/applications/gksu_reboot.desktop ${URLgithub}/main/Desktop/gksu_reboot.desktop

    wget --no-cache -O /usr/share/pixmaps/upgrade.png ${URLgithub}/main/Desktop/upgrade.png
    wget --no-cache -O /usr/share/pixmaps/shutdown.png ${URLgithub}/main/Desktop/shutdown.png
    wget --no-cache -O /usr/share/pixmaps/reboot.png ${URLgithub}/main/Desktop/reboot.png

    chmod 777 /usr/share/applications/gksu_*
    chmod 777 /usr/share/pixmaps/* -R
    chmod 777 /usr/bin/pkexec_upgrad* -R

    echo " ";
	dates=$(date +'%Y-%m-%d %H:%M')
	CUSTOM $Green "Installation completed" $IGreen "$dates" $BWhite "✔" "." "✔" 0
fi