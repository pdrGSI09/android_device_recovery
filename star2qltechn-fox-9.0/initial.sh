#!/bin/bash
# Sync
telegram -M "OrangeFox 9.0 (R11) - S9+ (star2qltechn): Sync started"
SYNC_START=$(date +"%s")

sudo -E apt-get -qq update
sudo -E apt-get -qq install bc zip libstdc++6 python gcc clang libssl-dev repo flex aria2
sudo apt-get install default-jdk android-tools-adb bison build-essential curl flex g++-multilib gcc-multilib gnupg gperf imagemagick lib32readline-dev lib32z1-dev liblz4-tool libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush yasm zlib1g-dev python3 python3-dev kernel-package bzip2 g++-multilib gcc-multilib make git libfdt-dev ccache flex g++-multilib gcc-multilib gnupg gperf imagemagick lib32ncurses5-dev libsdl1.2-dev libssl-dev rsync schedtool squashfs-tools xsltproc openjdk-8-jdk repo byacc m4 libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev python3-pip
sudo curl --create-dirs -L -o /usr/local/bin/repo -O -L https://storage.googleapis.com/git-repo-downloads/repo
sudo chmod a+rx /usr/local/bin/repo

repo init --depth=1 -u https://gitlab.com/OrangeFox/Manifest.git -b fox_9.0
git clone https://github.com/klabit87/twrp_android_device_samsung_star2qltechn.git -b 9.0 .repo/local_manifests
repo sync --no-repo-verify -c --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune -j`nproc`

SYNC_END=$(date +"%s")
SYNC_DIFF=$((SYNC_END - SYNC_START))
telegram -M "OrangeFox 9.0 (R11) - S9+ (star2qltechn): Sync completed successfully in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"

# Others
mv device/samsung/star2qltechn/build_ofox.sh .