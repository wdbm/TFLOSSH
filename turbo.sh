#!/bin/bash

mountrw(){
    sudo mount -o rw,remount /
}

setupfull(){
    mountrw
    sudo apt update
    wget -N https://bootstrap.pypa.io/get-pip.py
    sudo python get-pip.py
    sudo python3 get-pip.py
    #rm get-pip.py
    sudo apt install      \
        bc                \
        curl              \
        festival          \
        festvox-kallpc16k \
        geany             \
        hollywood         \
        htop              \
        iftop             \
        libnotify-bin     \ # notifications from terminal
        psmisc            \
        pv                \
        ranger            \
        tmux              \
        tree
    sudo apt install      \
        x11-apps          \
        geany             \
        xournal           \
        gdmap
    setupanbox
    setupapks
}

setupanbox(){
    mountrw
    sudo apt update
    sudo apt install anbox-ubuntu-touch android-tools-adb
    anbox-tool install
}

setupapks(){
    mountrw
    wget https://f-droid.org/FDroid.apk
    wget https://f-droid.org/repo/org.walleth_468.apk
    wget https://www.wdbm.pro:8080/download/file/resources/games/AI_Dungeon/2019-12-16/aidungeon-release.apk
    adb install FDroid.apk
    adb install org.walleth_468.apk
    adb install aidungeon-release.apk
}

resetupanbox(){
    rm -rf ~/anbox-data
    mountrw
    sudo apt remove anbox-ubuntu-touch
    sudo apt purge anbox-ubuntu-touch
    sudo apt autoremove
    setupanbox
}
