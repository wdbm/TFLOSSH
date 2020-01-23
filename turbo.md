# Meizu PRO 5

![](https://raw.githubusercontent.com/wdbm/TFLOSSH/master/media/DSC03294.JPG)

- model/codename: turbo

# setup: UBports Ubuntu Touch 16.04 with Anbox

This guide is intended to change a 64 GB Meizu PRO 5 Android Flyme international edition such that it is running UBports Ubuntu Touch 16.04 development edition with Anbox.

## prerequisites

An understanding of concepts like recovery images is assumed. An Ubuntu desktop installation is assumed for any interactions with the device. ADB, fastboot and ubuntu-device-flash should be installed on this system. The device can boot to fastboot by holding the power and volume down buttons simultaneously, and to the recovery image by holding the power and volume up buttons simultaneously.

fastboot is a diagnostic and engineering protocol to which a device can be booted. In fastboot, filesystem images can be modified via USB. Specifically, fastboot is a protocol for communications, software that runs on a device in fastboot mode and software that runs on a controlling computer.

## version compatibility notes

|**System**              |**Version**                                                                        |
|------------------------|-----------------------------------------------------------------------------------|
|UBports OS build number |2020-01-08                                                                         |
|UBports Image part      |20200108-27502                                                                     |
|Ubuntu build description|Ubuntu 16.04 LTS - armhf (20200108)                                                |
|Device image part       |20170608-43243                                                                     |
|Device build description|turbo-user 5.1 LMY47D 15 test-keys                                                 |
|Anbox                   |`pool/xenial/main/a/anbox/anbox-ubuntu-touch_8+0~20180916133012.39~1.gbpe34b59.deb`|

## from Flyme to UBports Ubuntu Touch 15.04 to UBports Ubuntu Touch 16.04 (2018-06)

### unlock bootloader

Download a Flyme update [update.zip](http://www.mediafire.com/file/om2hc051g46sm47/update.zip) and push the downloaded file to the root of the filesystem. To install the update, boot to the Flyme system recovery, select "System upgrade" and then select "Start". The device should reboot to the updated Flyme. In the updated Flyme, engage developer options and USB debugging. Boot the device to fastboot and unlock the bootloader using the  following command:

```Bash
sudo fastboot oem unlock
```

### flash TWRP recovery image and wipe Flyme

Download [TWRP_3.0_m86.img](http://xep.8800.org/pro5/TWRP_3.0_m86.img), boot the device to fastboot and flash the TWRP recovery image (over the Flyme recovery image) using the following command:

```Bash
sudo fastboot flash recovery TWRP_3.0_m86.img
```

Use TWRP to wipe Flyme from the device.

### resize partitions

Boot to TWRP, mount partitions using the TWRP GUI and then access the TWRP shell using ADB.

```Bash
adb shell
```

To prepare for UBports Ubuntu Touch 16.04, the partition sizes must be changed. The default partitions are as follows (with TWRP and UBports Ubuntu Touch 15.04 installed):

```Bash
~ # df -h
Filesystem                Size      Used Available Use% Mounted on
tmpfs                     1.8G     24.0K      1.8G   0% /dev
tmpfs                     1.8G     32.0K      1.8G   0% /tmp
/dev/block/sda43        495.9M    104.9M    380.8M  22% /cache
/dev/block/sda44         53.5G      2.1G     51.4G   4% /data
/dev/block/sda44         53.5G      2.1G     51.4G   4% /sdcard
```

With the filesystem wiped by TWRP, the partitions are as follows:

```Bash
~ # df -h
Filesystem                Size      Used Available Use% Mounted on
tmpfs                     1.8G     24.0K      1.8G   0% /dev
tmpfs                     1.8G    488.0K      1.8G   0% /tmp
/dev/block/sda41          2.4G      3.7M      2.4G   0% /system
/dev/block/sda44         53.5G     52.0M     53.4G   0% /data
/dev/block/sda44         53.5G     52.0M     53.4G   0% /sdcard
/dev/block/sda43        495.9M    400.0K    485.3M   0% /cache
```

In more standard units, this is as follows:

```Bash
~ # df
Filesystem           1K-blocks      Used Available Use% Mounted on
tmpfs                  1899196        24   1899172   0% /dev
tmpfs                  1899196       488   1898708   0% /tmp
/dev/block/sda41       2539312      3828   2519100   0% /system
/dev/block/sda44      56111432     53284  56041764   0% /data
/dev/block/sda44      56111432     53284  56041764   0% /sdcard
/dev/block/sda43        507848       400    496964   0% /cache
```

Mount some of the partitions in order to have a powerful enough `fdisk` application.

```Bash
mount /dev/block/sda41 /system
mount -t proc proc /system/proc
mount -t sysfs sys /system/sys
mount -o bind /dev /system/dev
chroot /system /bin/bash
```

Launch `fdisk`.

```Bash
fdisk /dev/block/sda
```

Access the `fdisk` menu by pressing `m`. Print the device partition table by pressing `p` and save this printout for reference:

```Bash
Disk /dev/block/sda: 58.2 GiB, 62537072640 bytes, 15267840 sectors
Units: sectors of 1 * 4096 = 4096 bytes
Sector size (logical/physical): 4096 bytes / 16384 bytes
I/O size (minimum/optimal): 16384 bytes / 8192 bytes
Disklabel type: gpt
Disk identifier: 00042021-0408-4601-9DCC-A8C51255994F

Device            Start      End  Sectors  Size Type
/dev/block/sda1    1024     1279      256    1M Microsoft basic data
/dev/block/sda2    1280     1343       64  256K Microsoft basic data
/dev/block/sda3    1344     1407       64  256K Microsoft basic data
/dev/block/sda21   2048     3071     1024    4M Microsoft basic data
/dev/block/sda22   3072     5119     2048    8M Microsoft basic data
/dev/block/sda23   5120     5631      512    2M Microsoft basic data
/dev/block/sda24   5632     6655     1024    4M Microsoft basic data
/dev/block/sda25   6656     7679     1024    4M Microsoft basic data
/dev/block/sda26   7680    13823     6144   24M Microsoft basic data
/dev/block/sda27  13824    22015     8192   32M Microsoft basic data
/dev/block/sda28  22016    30207     8192   32M Microsoft basic data
/dev/block/sda29  30208    35327     5120   20M Microsoft basic data
/dev/block/sda30  35328    40447     5120   20M Microsoft basic data
/dev/block/sda31  40448    45567     5120   20M Microsoft basic data
/dev/block/sda32  45568    50687     5120   20M Microsoft basic data
/dev/block/sda33  50688    55807     5120   20M Microsoft basic data
/dev/block/sda41  65536   720895   655360  2.5G Microsoft basic data
/dev/block/sda42 720896   851967   131072  512M Microsoft basic data
/dev/block/sda43 851968   983039   131072  512M Microsoft basic data
/dev/block/sda44 983040 15267834 14284795 54.5G Microsoft basic data
```

In changing the device from being suitable for UBports Ubuntu Touch 15.04 to being suitable for UBports Ubuntu Touch 16.04, partitions 42 and 43 are of interest because a larger cache partition is required. The size of partition 42 should be decreased in order to increase the size of partition 43. About 725 M is sufficient for partition 43 (the cache) but it can be set to greater than this. Whatever size is added to partition 43 must be taken from partition 42.

So, the goal is to keep all of the partitions up to partition 41 inclusive as they are and then to change the remaining to the following:

```Bash
/dev/block/sda42 720896   795135    74240  290M Microsoft basic data
/dev/block/sda43 795136   983039   187904  734M Microsoft basic data
/dev/block/sda44 983040 15267834 14284795 54.5G Microsoft basic data
```

This should give output like the following:

```Bash
The partition table has been altered.
Calling ioctl() to re-read partition table.
Re-reading the partition table failed.: Device or resource busy
```

The kernel continues to use the old table. The new table will be used at the next reboot. Name partition 42 "custom" and partition 43 "cache". After leaving `fdisk` for partition 43, reboot the device. Recommect via `adb` and format partition 43:

```Bash
mke2fs -t ext4 -m 0 /dev/block/sda43
```

### download UBports Ubuntu Touch 16.04

Download UBports Ubuntu using the `ubports-touch/16.04/devel` channel.

```Bash
rm -rf /home/"${USER}"/.cache/ubuntuimages
sudo ubuntu-device-flash                           \
    --server=http://system-image.ubports.com touch \
    --channel=ubports-touch/16.04/devel            \
    --device=turbo                                 \
    --download-only
```

These downloaded files can extracted and then copied to the device.

```Bash
adb push ~/.cache/ubuntuimages/ubports-touch/16.04/devel/turbo/version-85.tar.xz /sdcard/
adb push ~/.cache/ubuntuimages/pool/device-*.tar.xz                              /sdcard/
adb push ~/.cache/ubuntuimages/pool/keyring-*.tar.xz                             /sdcard/
adb push ~/.cache/ubuntuimages/pool/ubports-*.tar.xz                             /sdcard/
```

A UBports Ubuntu Touch 16.04 filesystem can be downloaded [here](https://ci.ubports.com/job/xenial-rootfs-armhf).

Mount all partitions.

```Bash
mount -a
```

To check if all partitions are successfully mounted use command `mount`. The output must have `/system` `/data` `/sdcard` with RW permissions, like this:

```Bash
~ # mount
rootfs on / type rootfs (rw)
tmpfs on /dev type tmpfs (rw,nosuid,relatime,mode=755)
devpts on /dev/pts type devpts (rw,relatime,mode=600)
proc on /proc type proc (rw,relatime)
sysfs on /sys type sysfs (rw,relatime)
tmpfs on /tmp type tmpfs (rw,relatime)
/dev/block/sda41 on /system type ext4 (rw,relatime,data=ordered)
/dev/block/sda44 on /data type ext4 (rw,relatime,data=ordered)
/dev/block/sda44 on /sdcard type ext4 (rw,relatime,data=ordered)
/dev/block/sda43 on /cache type ext4 (rw,relatime,data=ordered)
```

Change to the root directory.

```Bash
cd /
```

Using TWRP, wipe the device partitions and then extract the pushed UBports system files.

```Bash
tar -xvf /sdcard/device-60f53a5768e9340729d3a5ef9263bd3a9726792e7d0dbf830e5b124938dd419a.tar.xz
tar -xvf /sdcard/keyring-4c4e7ef380ebcfa2c31084efa199138e93bfed8fc58aa3eb06bdf75a78af9b57.tar.xz
tar -xvf /sdcard/ubports-614e9632145562ff3e95b340eed31f97ef8118438cea8440b47d52b03e36b294.tar.xz
tar -xvf /sdcard/version-85.tar.xz
```

Now some images must be flashed in order to enable the device to boot. Recovery is optional but required for OTA updates.

- **WARNING**: The bootloader expects `ldfw` and `dtb`.

```Bash
dd if=/partitions/boot.img     of=/dev/block/platform/15570000.ufs/by-name/bootimg
dd if=/partitions/logo.bin     of=/dev/block/platform/15570000.ufs/by-name/bootlogo
dd if=/partitions/dtb          of=/dev/block/platform/15570000.ufs/by-name/dtb
dd if=/blobs/ldfw              of=/dev/block/platform/15570000.ufs/by-name/ldfw
dd if=/partitions/recovery.img of=/dev/block/platform/15570000.ufs/by-name/recovery
```

### flash Ubuntu Touch recovery image

Download [recovery-turbo.img](http://cdimage.ubports.com/devices/recovery-turbo.img), boot the device to fastboot and run the following command to flash the Ubuntu Touch recovery (over the TWRP recovery image):

```Bash
sudo fastboot flash recovery recovery-turbo.img
```

## Anbox (2020-01-08T1841Z)

![](https://raw.githubusercontent.com/wdbm/TFLOSSH/master/media/DSC07698.JPG)

It is assumed that the development channel of UBports Ubuntu Touch 16.04 is used. Boot the phone to UBports Ubuntu Touch 16.04. In its terminal or via ADB shell, enter the following:

```Bash
sudo mount -o rw,remount /
sudo apt update
sudo apt install anbox-ubuntu-touch
anbox-tool install
```

The end of the terminal output should be like the following:

```Bash
Install done!
Anbox is ready to rock!
```

The version of Anbox that ends up installed can be checked using the command `apt-cache show anbox-ubuntu-touch`.

### Anbox on-screen keyboard (2020-01-08T2209Z)

This was available by default, but explicit details on it are as follows.

- <https://github.com/ubports/anbox/issues/5>
    - <https://github.com/ubports/anbox/issues/3>

```Bash
sudo mount -o rw,remount /
sudo apt update
sudo apt install anbox anbox-common anbox-ubuntu-touch
anbox-tool upgrade
```

### install Android applications

Install ADB on the device:

```Bash
sudo mount -o rw,remount /
sudo apt update
sudo apt install android-tools-adb
```

A reboot may be necessary for the device to be detectable to ADB as being not offline (using the command `adb devices`). It should be possible now to install Android application APKs in the following sort of way:

```Bash
adb install /home/phablet/Downloads/FDroid.apk
```

![](https://raw.githubusercontent.com/wdbm/TFLOSSH/master/media/IMG_20200108_194724.jpg)

### old instructions for installation of Android applications (may not be working)

Android program APKs can be installed in a way like the following. Copy the APK to the directory `/home/phablet/anbox-data/data`. On the phone, log into the Android container:

```Bash
lxc-console -ndefault -P /home/phablet/anbox-data/containers -t0
```

Change to the directory `/home/phablet/anbox-data/data` and then install the APK:

```Bash
pm install application.apk
```

The program should now be accessible as an Anbox launcher.

### uninstall Anbox

```Bash
rm -rf ~/anbox-data
sudo apt remove anbox-ubuntu-touch
sudo apt purge anbox-ubuntu-touch
sudo apt autoremove
```

# turbo.sh

`turbo.sh` is a small function library script that can be sourced for convenience.
