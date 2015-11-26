#!/bin/sh

set -e

catchlarger() {
    if [ "$?" != "98" ];then
        exit $?
    fi
}

for i in $(find -type f -name '*.png');do
    pngquant -o "$i-optimized" --skip-if-larger -- "$i" || catchlarger
    if [ -e "$i-optimized" ];then
        rm -f "$i"
        mv "$i-optimized" "$i"
    fi
done
