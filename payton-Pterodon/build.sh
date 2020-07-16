#!/bin/bash
# Sync

# Build
telegram -M "Pterodon - Moto X4: Building Recovery started"
SYNC_START=$(date +"%s")

. build/envsetup.sh
lunch omni_payton-eng
mka recoveryimage

SYNC_END=$(date +"%s")
SYNC_DIFF=$((SYNC_END - SYNC_START))
telegram -M "Pterodon - Moto X4: Building completed successfully in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"

# Output
ls out/target/product/payton/
telegram -M "Check the console!"
telegram -f out/target/product/payton/recovery.img "[Pterodon Recovery] [Unofficial] - Moto X4"
