#!/bin/bash


copy_files() {
cat <<EOF
build_gts210ltexx.sh
build_osprey.sh
build_osprey-user.sh
make_clean.sh
switch_microG.sh
EOF
}


copy_files | while read FILE; do
    cp "$FILE" ../../
done

