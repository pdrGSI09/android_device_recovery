#!/bin/bash
# Sync
telegram -M "Pterodon - Moto Z: Sync Device (Dependencies) Tree started"
SYNC_START=$(date +"%s")

. build/envsetup.sh
lunch omni_griffin-eng

SYNC_END=$(date +"%s")
SYNC_DIFF=$((SYNC_END - SYNC_START))
telegram -M "Pterodon - Moto Z: Device Tree Sync (Dependencies) completed successfully in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"

# Build
telegram -M "Pterodon - Moto Z: Building Recovery started"
SYNC_START=$(date +"%s")

mka recoveryimage

SYNC_END=$(date +"%s")
SYNC_DIFF=$((SYNC_END - SYNC_START))
telegram -M "Pterodon - Moto Z: Building completed successfully in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"

# Output
telegram -f out/target/product/griffin/recovery.img "[Pterodon Recovery] [Unofficial - TWRP's Tree Official Based] - Moto Z"