# Setup Base Image (Debian)

1. Setup Base OS

   Install latest Debian Net-install via CD
   
   **LATEST TESTED IMAGE (10.11)** <br/>
   Basic: https://cdimage.debian.org/mirror/cdimage/archive/10.11.0/amd64/iso-cd/ <br/>
   Additional Firmware: https://cdimage.debian.org/mirror/cdimage/unofficial/non-free/cd-including-firmware/archive/10.11.0+nonfree/amd64/iso-cd/ <br/>
   
   **MOST RECENT DEBIAN IMAGES (not tested)** <br/>
   Basic: [https://www.debian.org/CD/netinst/](https://www.debian.org/CD/netinst/) <br/>
   
   If VM, set VM Settings:
     - Set Ethernet adapter to Bridged Mode

   If PC, set PC / UEFI Settings:
     - Use Debian Image with Firmware
     - Disable Secure Boot

   Follow instructions:

     - Graphical Install
     - English, US, American English
     - Hostname: myNode
     - Domain Name: <LEAVE_EMPTY>
     - Root Password: bolt
     - Full Name: myNode
     - Username: mynode
     - Password: bolt
     - Timezone: Central
     - Partition: Manual, One ext4 Partition, No Swap
     - CDs and Packages: No, Next, Next
     - Software Selection: No GUI, No Print Server, Add SSH Server
     - Install Grub: Yes, /dev/sda
     - Install Complete: Continue

2. Login as root / bolt

3. Install basic Software

   ```sh
   apt-get -y install sudo
   useradd -p $(openssl passwd -1 bolt) -m -s /bin/bash admin
   adduser admin sudo
   ```

4. Delete mynode user

   ```sh
   deluser mynode
   rm -rf /home/mynode
   exit
   ```

5. Login as admin / bolt

6. Delete root password

   ```sh
   sudo passwd -d root
   ```

7. Update packages

   ```sh
   sudo apt-get -y update
   sudo apt-get -y upgrade
   ```

8. Install some basics

   ```sh
   sudo apt-get -y install tmux
   ```

9. Sync

   ```sh
   sync
   sudo shutdown -h now
   ```

10. Make image now (if imaging)
