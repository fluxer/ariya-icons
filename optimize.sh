#!/bin/sh

set -e

for i in $(find -type f -name '*.png');do
    pngquant "$i" -o "$i-optimized"
    if [ -e "$i-optimized" ];then
        rm -f "$i"
        mv "$i-optimized" "$i"
    fi
done
