#!/bin/bash

echo "" > $PREFIX/etc/apt/sources.list
echo "deb https://mirrors.cbrx.io/apt/termux/termux-main stable main" >> $PREFIX/etc/apt/sources.list
echo "deb https://mirrors.cbrx.io/apt/termux/termux-root root stable" >> $PREFIX/etc/apt/sources.list
echo "deb https://mirrors.cbrx.io/apt/termux/termux-x11 x11 main" >> $PREFIX/etc/apt/sources.list
