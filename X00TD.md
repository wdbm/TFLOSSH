# Asus ZenFone Max Pro M1

![](https://raw.githubusercontent.com/wdbm/TFLOSSH/master/media/2019-01-23T0444Z.png)

- model/codename: ASUS_X00TD

# motivations

- openness: The device fully supports bootloader unlocking, LineageOS, F-Droid and other open efforts.
- security: Asus is based in Taiwan. There are reports of hardware backdoors in places like China and the USA.
- environment: Asus has received environmental friendlessness recognition in independent assessment.

# setup: LineageOS, F-Droid, TWRP 2019-01

This setup procedure resulted in a standard device being unlocked using the Asus official method and then having LineageOS, F-Droid and TWRP installed on it. It does not feature Open GApps (so it does not feature proprietary Google features that come preinstalled on most Android devices, such as Google Play).

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
