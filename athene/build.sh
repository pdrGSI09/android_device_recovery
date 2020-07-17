#!/bin/bash
# Sync
telegram -M "TWRP - Moto G4 Plus: Sync Device (Dependencies) Tree started"
SYNC_START=$(date +"%s")

. build/envsetup.sh
lunch omni_athene-eng
SYNC_END=$(date +"%s")
SYNC_DIFF=$((SYNC_END - SYNC_START))
telegram -M "TWRP - Moto G4 Plus: Device Tree Sync (Dependencies) completed successfully in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"

# Build
telegram -m "TWRP - Moto G4 Plus: Building Recovery started"
SYNC_START=$(date +"%s")

export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL=C
mka recoveryimage

SYNC_END=$(date +"%s")
SYNC_DIFF=$((SYNC_END - SYNC_START))
telegram -M "TWRP - Moto G4 Plus: Building completed successfully in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"

# Output
telegram -f out/target/product/athene/recovery.img "[TWRP Recovery] [Unofficial] - Moto G4 Plus"
