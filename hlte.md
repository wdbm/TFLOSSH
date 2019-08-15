# Samsung Galaxy Note 3 (upcoming documentation)

![](https://raw.githubusercontent.com/wdbm/TFLOSSH/master/media/2019-08-15T1757Z.png)

- model/codename: SM-N9005

# motivations

- openness: The device fully supports bootloader unlocking, LineageOS, F-Droid and other open efforts.
- security: Samsung is based in South Korea. There are reports of hardware backdoors in places like China and the USA.

# setup: LineageOS, F-Droid, TWRP 2019-08

## install TWRP

Reboot the device to fastboot mode by pressing the home, power and volume down buttons at the same time. When this is done, connect the device to a computer and it should be visible:

```Bash
sudo fastboot devices
XXXXXXXXXXXXXXX	fastboot
```

Here, the string "XXXXXXXXXXXXXXX" represents some other alphanumeric string.

Download TWRP (e.g. [`twrp-3.3.1-0-hlte.img`](https://eu.dl.twrp.me/hlte/twrp-3.3.1-0-hlte.img)).

Flash TWRP to the device via fastboot.

```Bash
fastboot flash recovery twrp-3.3.1-0-hlte.img
```

Boot the device to TWRP by pressing the home, power and volume up buttons at the same time until the Samsung logo appears, then release the buttons.
- Wipe > Advanced Wipe
    - Cache
    - System

If there is a data decryption problem, select to format the data.

## install LineageOS

- [device LineageOS Wiki](https://wiki.lineageos.org/devices/hlte)

Download LineageOS (e.g. [`lineage-16.0-20190813-nightly-hlte-signed.zip`](https://mirrorbits.lineageos.org/full/hlte/20190813/lineage-16.0-20190813-nightly-hlte-signed.zip)).

- [device LineageOS download](https://download.lineageos.org/hlte)

Transfer the LineageOS ZIP file to the device internal storage while TWRP is running. This can be done using ADB:

- Advanced > ADB Sideload

```Bash
sudo adb sideload lineage-16.0-20190813-nightly-hlte-signed.zip
```

- Install > lineage-16.0-20190813-nightly-hlte-signed.zip > Swipe to confirm Flash

## install F-Droid

- [F-Droid](https://f-droid.org)

The setup should now be complete.
