#!/bin/bash

TMP=$PREFIX/tmp

SYNCTHING_NAME=syncthing-linux-arm64-v1.29.5
SYNCTHING_URL=https://github.com/syncthing/syncthing/releases/download/v1.29.5/syncthing-linux-arm64-v1.29.5.tar.gz
SYNCTHING_PATH=$HOME/apps/syncthing
SYNCTHING_ARC=$TMP/syncthing.tgz

[ -f $SYNCTHING_ARC ] || curl -L $SYNCTHING_URL -o $SYNCTHING_ARC
[ -d $TMP/$SYNCTHING_NAME ] || tar -xvf $SYNCTHING_ARC -C $TMP
[ -z "$SYNCTHING_PATH/*" ] && mv $TMP/SYNCTHING_NAME $SYNCTHING_PATH

mkdir -p $PREFIX/var/service/syncthing/log
ln -sf $PREFIX/share/termux-services/svlogger $PREFIX/var/service/syncthing/log/run

cat << EOS > $PREFIX/var/service/syncthing/run
  #!/data/data/com.termux/files/usr/bin/sh
  exec $SYNCTHING_PATH/syncthing 2>&1
EOS
chmod +x $PREFIX/var/service/syncthing/run

sv-enable syncthing
