#!/bin/bash
# Build
telegram -m "OrangeFox (R10.1) - A20s: Building Recovery started"
SYNC_START=$(date +"%s")

./buildfox.sh a207M

SYNC_END=$(date +"%s")
SYNC_DIFF=$((SYNC_END - SYNC_START))
telegram -M "OrangeFox (R10.1) - A20s: Building completed successfully in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"

# Output
telegram -f out/target/product/a207M/OrangeFox-unofficial-.img "[OrangeFox (R10.1) Recovery] [Unofficial] - Samsung Galaxy A20s"
