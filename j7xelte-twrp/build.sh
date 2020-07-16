#!/bin/bash

# Build
telegram -m "TWRP - J7 (j7xelte): Building Recovery started"
SYNC_START=$(date +"%s")

export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL=C
. build_twrp.sh j7xelte

SYNC_END=$(date +"%s")
SYNC_DIFF=$((SYNC_END - SYNC_START))
telegram -M "TWRP - J7 (j7xelte): Building completed successfully in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"

# Output
telegram -f out/target/product/j7xelte/recovery.img "[TWRP Recovery] [Unofficial] - J7 (j7xelte)"
