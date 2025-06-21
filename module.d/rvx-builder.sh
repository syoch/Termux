#!/bin/bash

mkdir -p $HOME/apps/rvx-builder
cd $HOME/apps/rvx-builder

curl -sLo rvx-builder.sh https://raw.githubusercontent.com/inotia00/rvx-builder/revanced-extended/android-interface.sh
chmod +x rvx-builder.sh
./rvx-builder.sh