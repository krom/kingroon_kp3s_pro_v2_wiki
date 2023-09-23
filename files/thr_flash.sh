#!/bin/bash
COLOR_NC='\e[0m' # No Color
COLOR_BLACK='\e[0;30m'
COLOR_GRAY='\e[1;30m'
COLOR_RED='\e[0;31m'
COLOR_LIGHT_RED='\e[1;31m'
COLOR_GREEN='\e[0;32m'
COLOR_LIGHT_GREEN='\e[1;32m'
COLOR_BROWN='\e[0;33m'
COLOR_YELLOW='\e[1;33m'
COLOR_BLUE='\e[0;34m'
COLOR_LIGHT_BLUE='\e[1;34m'
COLOR_PURPLE='\e[0;35m'
COLOR_LIGHT_PURPLE='\e[1;35m'
COLOR_CYAN='\e[0;36m'
COLOR_LIGHT_CYAN='\e[1;36m'
COLOR_LIGHT_GRAY='\e[0;37m'
COLOR_WHITE='\e[1;37m'
PS3="Please enter your choose: "
echo THR Board firmware flasher by @krom


do_init() {
  ls "/dev/serial/by-id/usb-Klipper*" >/dev/null 2>&1
  NORMAL_MODE=$?
  allow_to_flash=1
  echo -n "Checking permissions: "
  if [ "$EUID" -eq 0 ]
    then
      echo -e "${COLOR_GREEN}OK${COLOR_NC}"
    else
      echo -e "${COLOR_RED}Please run as root${COLOR_NC}"
  fi

  echo -en "Searching for THR: "
  if [ ! -f /dev/sda1 ] && [ $NORMAL_MODE -ne 0 ]; then
    echo -e "${COLOR_RED}Not found${COLOR_NC}"
    allow_to_flash=0
  else
    echo -en "THR mode: "
    if [ -f /dev/sda1 ]; then
        echo -e "${COLOR_GREEN}Bootloader${COLOR_NC}"
    fi;
    if [ $NORMAL_MODE -eq 0 ]; then
        echo -e "${COLOR_YELLOW}Normal mode${COLOR_NC}"
        allow_to_flash=0
    fi;
  fi;
}

do_flash () {
  if [ $allow_to_flash -eq 1 ]; then
    echo Downloading firmware...
    #wget https://github.com/krom/kingroon_kp3s_pro_v2_wiki/raw/main/files/klipper.uf2
    echo Mounting THR...
    #mkdir /mnt/head/
    #mount -t vfat /dev/sda1 /mnt/head/
    echo Flashing THR...
    #cp klipper.uf2 /mnt/head/
    #sync
    echo "Done"
  else
    echo -e "${COLOR_RED}Please start bootloader${COLOR_NC}"
  fi;

}

do_show_menu() {
  echo ""
  echo -e "${COLOR_BLUE}----------------------------${COLOR_NC}"
  if [ $allow_to_flash -eq 0 ]; then echo -en "$COLOR_LIGHT_GRAY"; fi;
  echo [1] Flash firmware
  echo -en "$COLOR_NC"
  echo [2] Refresh
  echo [q] Quit
  echo -n "${PS3}"
}

do_init
while true;  do
  do_show_menu
  read -r answer
  case $answer in
      1)
        do_flash
        ;;
      2)
        do_init
        ;;
      q)
        echo "Bye-Bye"
        exit 0
        ;;
      *) echo "invalid option $REPLY";;
  esac
done
