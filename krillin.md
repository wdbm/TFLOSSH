# BQ Aquaris E4.5

![](https://raw.githubusercontent.com/wdbm/TFLOSSH/master/media/DSCF3923.JPG)

- model/codename: krillin

# setup: UBports Ubuntu Touch 16.04 (2020-01)

Use the UBports Installer.

- <http://docs.ubports.com/en/latest/userguide/install.html>
- <https://github.com/ubports/ubports-installer>

# setup: Canonical Ubuntu Touch 15.04 (2015-07-22)

- <https://github.com/bq/aquaris-E4.5>

```Bash
sudo add-apt-repository ppa:ubuntu-sdk-team/ppa
sudo apt-get update
sudo apt-get -y install ubuntu-device-flash
wget http://people.canonical.com/~jhm/barajas/recovery-krillin.img
```

Power off the device. Connect the device via USB. Clear the local computer cache for download of the recovery image.

```Bash
ubuntu-device-flash --clean-cache touch
```

Prepare to download and write the recovery image to the device.

```Bash
ubuntu-device-flash touch --channel ubuntu-touch/stable/bq-aquaris.en --bootstrap --recovery-image recovery-krillin.img
```

The following is the command for the development version of the recovery image:

```Bash
ubuntu-device-flash touch --channel ubuntu-touch/devel/krillin.en --bootstrap --recovery-image recovery-krillin.img
```

Wait for the message "Expecting the device to be in the bootloader... waiting". Set the device to the bootloader mode by holding `power` `volume up` for a few seconds, then releasing power when the red LED lights as the device reboots and then selecting fastboot from the device boot menu by selecting `volume down` as enter. The terminal output should be something like the following:

```Bash
>ubuntu-device-flash touch --channel ubuntu-touch/stable/bq-aquaris.en --bootstrap --recovery-image recovery-krillin.img
2015/07/22 07:49:57 Expecting the device to be in the bootloader... waiting
2015/07/22 07:50:00 Device is |krillin|
2015/07/22 07:50:00 Flashing version 24 from ubuntu-touch/stable/bq-aquaris.en channel and server https://system-image.ubuntu.com to device krillin
5.12 MB / 61.28 MB [=>________________________________] 8.36 % 397.27 KB/s 2m24s2015/07/22 07:50:14 Start pushing /home/wbm/.cache/ubuntuimages/ubuntu-touch/stable/bq-aquaris.en/krillin/version-24.tar.xz to device
2015/07/22 07:50:14 Start pushing /home/wbm/.cache/ubuntuimages/gpg/image-master.tar.xz to device
2015/07/22 07:50:14 Start pushing /home/wbm/.cache/ubuntuimages/gpg/image-signing.tar.xz to device
5.16 MB / 61.28 MB [=>________________________________] 8.41 % 393.72 KB/s 2m25s2015/07/22 07:50:14 Done pushing /home/wbm/.cache/ubuntuimages/gpg/image-master.tar.xz to device
2015/07/22 07:50:14 Done pushing /home/wbm/.cache/ubuntuimages/ubuntu-touch/stable/bq-aquaris.en/krillin/version-24.tar.xz to device
2015/07/22 07:50:14 Done pushing /home/wbm/.cache/ubuntuimages/gpg/image-signing.tar.xz to device
61.28 MB / 61.28 MB [====================================] 100.00 % 379.08 KB/s 
2015/07/22 07:52:46 Start pushing /home/wbm/.cache/ubuntuimages/pool/custom-04c0e82d52c90b32483b261b61b691a52144954614ff6d50e1de9c5bfc8a03c0.tar.xz to device
63.11 MB / 68.33 MB [==============================>___] 92.37 % 376.25 KB/s 14s2015/07/22 07:52:53 Done pushing /home/wbm/.cache/ubuntuimages/pool/custom-04c0e82d52c90b32483b261b61b691a52144954614ff6d50e1de9c5bfc8a03c0.tar.xz to device
68.33 MB / 68.33 MB [====================================] 100.00 % 383.60 KB/s 
2015/07/22 07:53:03 Start pushing /home/wbm/.cache/ubuntuimages/pool/device-168ccf6a391da4f83feb0325783f02b313e3892675bfea9e4a036bd63fd24f93.tar.xz to device
66.33 MB / 285.97 MB [=====>________________________] 23.19 % 359.02 KB/s 10m26s2015/07/22 07:53:10 Done pushing /home/wbm/.cache/ubuntuimages/pool/device-168ccf6a391da4f83feb0325783f02b313e3892675bfea9e4a036bd63fd24f93.tar.xz to device
285.97 MB / 285.97 MB [==================================] 100.00 % 623.87 KB/s 
2015/07/22 07:57:50 Start pushing /home/wbm/.cache/ubuntuimages/pool/ubuntu-61dbd90be1acf5c2e4c9341f77e7054c98d4a53e90b1a211bcda9d2a02894368.tar.xz to device
2015/07/22 07:58:20 Done pushing /home/wbm/.cache/ubuntuimages/pool/ubuntu-61dbd90be1acf5c2e4c9341f77e7054c98d4a53e90b1a211bcda9d2a02894368.tar.xz to device
2015/07/22 07:58:20 Created ubuntu_command: /home/wbm/.cache/ubuntuimages/ubuntu_commands767555341
2015/07/22 07:58:20 Rebooting into recovery to flash
```

The device should display the Ubuntu logo for a while and then reboot into a working system. For OTA-12 downloaded at CERN, the total time from start to completed device boot is ~10 minutes. Back up the cached downloaded image if necessary. It gets stored in a file like `
home/wbm/.cache/ubuntuimages/ubuntu-touch/stable/bq-aquaris.en/krillin/version-27.tar.xz`. The cache for the download is at the directory `/home/wbm/.cache/ubuntuimages`. This can be backed up.

```Bash
cp -R /home/wbm/.cache/ubuntuimages Ubuntu_15.04_OTA-12_stable
cp -R /home/wbm/.cache/ubuntuimages Ubuntu_15.04_OTA-12_devel
```

# daily builds


```Bash
sudo mount -o remount,rw /
sudo add-apt-repository ppa:phablet-team/ppa
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
```

![](https://raw.githubusercontent.com/wdbm/TFLOSSH/master/media/DSCF0140.JPG)

# backup 2016-07-20T1829Z

Back up everything at the directory `/home/phablet`, including all hidden directories, such as `/home/phablet/.config`. This should back up everything except applications, which are at a number of directories, including `/opt/click.ubuntu.com/` and `/usr/share/click/preinstalled`. It might be worthwhile to back up the directory `.cache`. Get a list of all installed applications:

```Bash
click list
```

On factory reset, reinstall all applications and then restore `home/phablet`.

- <http://askubuntu.com/questions/797556/how-can-an-image-of-an-ubuntu-phone-be-taken>
- <http://askubuntu.com/questions/602850/how-do-i-backup-my-ubuntu-phone>

# install TWRP

- <https://twrp.me/devices/bqaquarise45.html>

Install Ubuntu Touch. Install without reboot, or, when it boots, do not set it up; leave it as a fresh installation. Download the TWRP recovery image.

```Bash
wget https://dl.twrp.me/krillin/twrp-3.0.2-0-krillin.img
```

Boot to fastboot using `power` `volume up` or ADB.

```Bash
adb reboot bootloader
```

Install TWRP as the recovery image. This should take only a moment.

```Bash
sudo fastboot flash recovery twrp-3.0.2-0-krillin.img
sudo fastboot reboot
```

Boot to TWRP using `power` `volume up` and then selecting recovery. Select backup to backup the Ubuntu partition. Back up to internal storage or SD card. For internal storage, the backup directory is something like `/data/media/TWRP/BACKUPS/JU014273/2016-08-08--07-21-54`.
