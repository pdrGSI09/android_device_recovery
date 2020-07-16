#!/bin/bash
# Sync

# Build
telegram -M "SHRP - Moto X4: Building Recovery started"
SYNC_START=$(date +"%s")

. build/envsetup.sh
lunch omni_payton-eng
mka recoveryimage

SYNC_END=$(date +"%s")
SYNC_DIFF=$((SYNC_END - SYNC_START))
telegram -M "SHRP - Moto X4: Building completed successfully in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"

# Output
telegram -f out/target/product/payton/*.zip "[SHRP Recovery] [Unofficial] - Moto X4"
