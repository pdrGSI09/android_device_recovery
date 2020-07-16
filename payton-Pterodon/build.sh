#!/bin/bash
# Build
telegram -M "Pterodon: The source are broken (If you have fix, share in @yumigsis2"
telegram -M "Pterodon - Moto X4: Building Recovery started"
SYNC_START=$(date +"%s")

export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL=C
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
