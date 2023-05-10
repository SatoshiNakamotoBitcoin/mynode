#!/bin/bash

set -x

# NO LONGER USED

# source /usr/share/mynode/mynode_device_info.sh

# # Allow UAS
# if [ -f /mnt/hdd/mynode/settings/.uas_usb_enabled ] || [ -f /home/bitcoin/.mynode/.uas_usb_enabled ]; then
#     cat /boot/cmdline.txt | grep "usb-storage.quirks="
#     if [ $? -eq 0 ]; then
#         cat /boot/cmdline.txt | grep "usb-storage.quirks=none"
#         if [ $? -eq 0 ]; then
#             exit 0
#         else
#             sed -i "s/usb-storage.quirks=.*/usb-storage.quirks=none/g" /boot/cmdline.txt
#             sync
#             /usr/bin/mynode-reboot
#         fi
#     fi
#     exit 0
# else
#     # Disable UAS
#     lsusb -t | grep "Driver=uas"
#     if [ $? -eq 0 ]; then
#         echo "UAS FOUND"
#         USBINFO=$(lsusb | grep "SATA 6Gb/s bridge")
#         DEVID=$(egrep -o '[0-9a-f]+:[0-9a-f]+' <<< $USBINFO)
#         QUIRK="${DEVID}:u"
#         echo "UAS IN USE ON $DEVID"

#         # Raspberry Pi
#         if [ $IS_RASPI -eq 1 ]; then
#             echo "IS RASPBERRY PI"
#             if [ -f /boot/cmdline.txt ]; then
#                 CMDLINE=$(head -n 1 /boot/cmdline.txt)
#                 cat /boot/cmdline.txt | grep "usb-storage.quirks"
#                 if [ $? -eq 0 ]; then
#                     cat /boot/cmdline.txt | grep "usb-storage.quirks=${QUIRK}"
#                     if [ $? -eq 0 ]; then
#                         # Quirk already added, exit 0
#                         echo "QUIRK ALREADY EXISTS, EXITING"
#                         exit 0
#                     else
#                         # Different quirk exists, update and reboot
#                         echo "DIFFERENT QUIRK FOUND, UPDATING AND REBOOTING"
#                         sed -i "s/usb-storage.quirks=.*/usb-storage.quirks=${QUIRK}/g" /boot/cmdline.txt
#                     fi
#                 else
#                     # No quirk found, add it and reboot
#                     echo "NO QUIRK FOUND, ADDING AND REBOOTING"
#                     echo "${CMDLINE} usb-storage.quirks=${QUIRK}" > /boot/cmdline.txt
#                 fi

#                 sync
#                 sleep 5s
#                 /usr/bin/mynode-reboot
#             fi
#         fi

#         # RockPi 4
#         if [ $IS_ROCKPI4 -eq 1 ]; then
#             echo "IS ROCKPI 4"
#             if [ -f /boot/armbianEnv.txt ]; then
#                 cat /boot/armbianEnv.txt | grep "${QUIRK}"
#                 if [ $? -eq 0 ]; then
#                     # Quirk already added, exit 0
#                     echo "QUIRK ALREADY EXISTS, EXITING"
#                     exit 0
#                 else
#                     echo "ADDING QUIRK AND REBOOTING"
#                     sed -i "s/usbstoragequirks=.*/&,${QUIRK}/g" /boot/armbianEnv.txt
#                     mkimage -C none -A arm -T script -d /boot/boot.cmd /boot/boot.scr
#                     sync
#                     sleep 5s
#                     /usr/bin/mynode-reboot
#                 fi
#             fi
#         fi
#     else
#         echo "No UAS devices found"
#     fi
# fi