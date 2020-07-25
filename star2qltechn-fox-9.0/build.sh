#!/bin/bash

# Build
telegram -m "OrangeFox 9.0 (R10.1) - S9+ (star2qltechn): Building Recovery started"
SYNC_START=$(date +"%s")

export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL=C
. build_ofox.sh star2qltechn

SYNC_END=$(date +"%s")
SYNC_DIFF=$((SYNC_END - SYNC_START))
telegram -M "OrangeFox 9.0 (R10.1) - S9+ (star2qltechn): Building completed successfully in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"

# Output
telegram -f out/target/product/star2qltechn/recovery.img "[TWRP Recovery] [Unofficial] - S9+ (star2qltechn)"
