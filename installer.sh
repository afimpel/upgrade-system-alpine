#!/bin/sh
# Reset
systemRUN="$2"
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[0;105m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # White
UUID=$(id -u)
UUID=$(( UUID + 0 ))
I_OK="✔"
I_KO="✖️"

NC='\e[0m'


R1 () {
    data=$(completeLine "$2" "$5" 1);
    printf " ${3}$4 ${NC}$1 $data ${3}$4${NC}\n${NC}"
}

CUSTOM () {
    echo $systemRUN
    data=$(completeLine "$2" "$7" 3 "$4" $9);
    printf " ${5}$6 ${NC}$1 $2$3 $data ${5}$8${NC}\n${NC}"
}

L1 () {
    data=$(completeLine "$2" "$5" 2);
    printf " ${3}$4 ${NC}$1 $data ${3}$4${NC}\n${NC}"
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
    apk add sudo bash wget curl
    echo "%wheel ALL=(ALL:ALL) ALL" > /etc/sudoers.d/wheel
    echo "%wheel ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown, /usr/bin/upgrade-syste*, /usr/bin/package-update" >> /etc/sudoers.d/wheel
    adduser $users wheel

    wget --no-cache -O /usr/bin/package-update ${URLgithub}/main/package-update
    wget --no-cache -O /usr/bin/upgrade-system ${URLgithub}/main/upgrade-system
    wget --no-cache -O /usr/bin/upgrade-system-poweroff ${URLgithub}/main/upgrade-system-poweroff
    wget --no-cache -O /usr/bin/upgrade-system-reboot ${URLgithub}/main/upgrade-system-reboot

    chmod 777 /usr/bin/package-update -R
    chmod 777 /usr/bin/upgrade-system* -R
fi
