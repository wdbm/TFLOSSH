# Asus ZenFone Max Pro M1

![](https://raw.githubusercontent.com/wdbm/TFLOSSH/master/media/2019-01-31T2238Z.png)

- model/codename: ASUS_X00TD

# motivations

- openness: The device fully supports bootloader unlocking, LineageOS, F-Droid and other open efforts.
- security: Asus is based in Taiwan. There are reports of hardware backdoors in places like China and the USA.
- environment: Asus has received environmental friendlessness recognition in independent assessment.

# setup: LineageOS, F-Droid, TWRP 2019-01

This setup procedure resulted in a standard device being unlocked using the Asus official method and then having LineageOS, F-Droid and TWRP installed on it. It does not feature Open GApps (so it does not feature proprietary Google features that come preinstalled on most Android devices, such as Google Play).

![](https://raw.githubusercontent.com/wdbm/TFLOSSH/master/media/2019-01-23T0444Z.png)

## enable developer mode, ADB

Boot the device to its default Android installation and enable its developer mode in order to start its ADB server. When this is done, connect the device to a computer and it should be visible:

```Bash
sudo adb devices
* daemon not running. starting it now on port 5037 *
* daemon started successfully *
List of devices attached 
XXXXXXXXXXXXXXX	device
```

Here, the string "XXXXXXXXXXXXXXX" represents some other alphanumeric string.

## unlock bootloader

- [XDA guide](https://forum.xda-developers.com/asus-zenfone-max-pro-m1/how-to/discussion-unlocking-bootloader-t3786698)

### method: official APK

There is an official APK (`UnlockTool_9.1.0.3_180621_fulldpi_signed_ZB601KL.apk`) which unlocks the bootloader. In doing so, it requires an internet connection to send a record of this unlocking action to Asus.

- [Asus device page](https://www.asus.com/Phone/ZenFone-Max-Pro-M1/HelpDesk_Download)
- [UnlockTool_9.1.0.3_180621_fulldpi_signed_ZB601KL.apk](https://dlcdnets.asus.com/pub/ASUS/ZenFone/ZB601KL/UnlockTool_9.1.0.3_180621_fulldpi_signed_ZB601KL.apk)
- [XDA post for APK to unlock](https://forum.xda-developers.com/asus-zenfone-max-pro-m1/development/official-zenfone-max-pro-m1-official-t3869458)

Download and then install the application.

```Bash
sudo adb install UnlockTool_9.1.0.3_180621_fulldpi_signed_ZB601KL.apk
4449 KB/s (758249 bytes in 0.166s)
Success
```

Run the application. Unlocking using the application may take multiple attempts. On success, the device should reboot and a message should display with instructions. Press and hold the power button. This should reboot the device. Leave the device to boot. The device should now induce a factory reset (which involves the display of an "encrypting" display). The device should then boot as new.

### method: unofficial executable by liunianliang

This method has not been tested here but would likely provide the benefit of privacy.

- [unlock.rar](https://drive.google.com/drive/folders/1YpezCedaRWGDS9WW7UaXXyyBod0Bk5qp)

```Bash
dtrx unlock.rar
cd unlock/unlock
chmod 755 unlock.sh
sudo ./unlock.sh
```

The device should now display "Press any key to shut down." Press the power button. The device should reboot with its bootloader unlocked.

The following procedure has been extracted from the script `unlock.sh`:

After unlocking developer mode, reboot to fastboot mode by holding the power and volume up keys.

```Bash
sudo su
apt install adb fastboot

default_platform="sdm636"
default_buildtype="eng"
default_slot="a"

platform=`fastboot getvar platform 2>&1 | grep platform | awk '{print $NF}'`
buildtype=`fastboot getvar build-type 2>&1 | grep build-type | awk '{print $NF}'`
slot=`fastboot getvar current-slot 2>&1 | grep current-slot | awk '{print $NF}'`

echo "platform:   "${platform}""
echo "build-type: "${buildtype}""
echo "slot:       "${slot}""

# get the secret key and partition
secret_key=`fastboot getvar secret-key-opt 2>&1 | grep secret-key-opt | awk '{print $NF}'`
secret_partition=`fastboot oem get_random_partition 2>&1 | grep bootloader | awk '{print $NF}'`

echo -e "secret key:       "${secret_key}"\esecret partition: "${secret_partition}""

if [ -z "${platform}" ];then
    platform="${default_platform}"
fi
if [ -z "${buildtype}" ];then
    buildtype="${default_buildtype}"
fi
#if [ -z "${slot}" ];then
#    slot="${default_slot}"
#fi
slot="${default_slot}"

if [ "${buildtype}" = "user" ]; then
    echo "${secret_key}" > default_key.bin
    fastboot flash "${secret_partition}" default_key.bin
    fastboot flashing unlock
    fastboot flashing unlock_critical
fi

# download function
split=$(printf "%-60s" "-")
function flash_one_image() {
    echo -e "\n${split// /-}"
    if [ -e "${platform}_$2" ];then
        echo -e "\E[0;32mbegin fastboot download ${platform}_$2\E[00m\n"
        fastboot flash $1 ${platform}_$2
    elif [ -e "$2" ];then
        echo -e "\E[0;32mbegin fastboot download $2\E[00m\n"
        fastboot flash $1 $2
    else
        echo -e "\E[1;31mCan't find file: $2 or ${platform}_$2, Skip!\E[00m\n"
    fi
}

echo -e "\nDownload complete. Reboot? (y/n)"
read x
if [ "${x}" == "y" ] || [ "${x}" == "Y" ];then
    fastboot oem recovery_and_reboot
fi
```

It might be beneficial to record the secret key and the secret partition.

## install TWRP

Reboot the device to fastboot mode by pressing the power and volume up buttons at the same time. When this is done, connect the device to a computer and it should be visible:

```Bash
sudo fastboot devices
XXXXXXXXXXXXXXX	fastboot
```

Here, the string "XXXXXXXXXXXXXXX" represents some other alphanumeric string.

Download TWRP (e.g. `twrp-3.2.3-0-X00TD-20180814.img`).

Flash TWRP to the device via fastboot.

```Bash
fastboot flash recovery twrp-3.2.3-0-X00TD-20180814.img
```

Boot the device to TWRP by pressing the power and volume down buttons at the same time until the ASUS logo appears, then release the buttons.

- Wipe > Advanced Wipe
    - Cache
    - System

If there is a data decryption problem, select to format the data.

## install LineageOS

- [device LineageOS Wiki](https://wiki.lineageos.org/devices/X00TD)

Download LineageOS (e.g. `lineage-15.1-20190103-nightly-X00TD-signed.zip`).

- [device LineageOS download](https://download.lineageos.org/X00TD)

Transfer the LineageOS ZIP file to the device internal storage while TWRP is running. This can be done using ADB:

- Advanced > ADB Sideload

```Bash
sudo adb sideload lineage-15.1-20190103-nightly-X00TD-signed.zip
```

- Install > lineage-15.1-20190103-nightly-X00TD-signed.zip > Swipe to confirm Flash

## install F-Droid

- [F-Droid](https://f-droid.org)

The setup should now be complete.
