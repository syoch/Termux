#!/bin/bash

TMP=$PREFIX/tmp
BIN=~/bin

SYNCTHING_NAME=syncthing-linux-arm64-v1.29.5
SYNCTHING_URL=https://github.com/syncthing/syncthing/releases/download/v1.29.5/syncthing-linux-arm64-v1.29.5.tar.gz
SYNCTHING_PATH=$BIN/syncthing
SYNCTHING_ARC=$TMP/syncthing.tgz

[ -f $SYNCTHING_ARC ] || curl -L $SYNCTHING_URL -o $SYNCTHING_ARC
[ -d $TMP/$SYNCTHING_NAME ] || tar -xvf $SYNCTHING_ARC -C $TMP
[ -z "$SYNCTHING_PATH/*" ] && mv $TMP/SYNCTHING_NAME $SYNCTHING_PATH

mkdir -p $SVDIR/syncthing/log
ln -sf $PREFIX/share/termux-services/svlogger $SVDIR/syncthing/log/run

cat << EOS > $SVDIR/syncthing/run
  #!/data/data/com.termux/files/usr/bin/sh
  exec $BIN/syncthing/syncthing 2>&1
EOS
chmod +x $SVDIR/syncthing/run

sv-enable syncthing
