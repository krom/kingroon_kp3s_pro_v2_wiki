#!/bin/bash
if [ ! -f /dev/sda1 ]; then
  echo Error: THR Board not found
  exit 1
fi;
wget https://github.com/krom/kingroon_kp3s_pro_v2_wiki/raw/main/files/klipper.uf2
mkdir /mnt/head/
mount -t vfat /dev/sda1 /mnt/head/
cp klipper.uf2 /mnt/head/
sync