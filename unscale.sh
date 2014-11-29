#!/bin/bash

set -e

for size in 16 24 32 48 64 128;do
    rm -vrf "${size}x${size}/"
    for file in scalable/*/*.svg scalable/*/*.svgz;do
        dir="$(basename $(dirname $file))"
        base="$(basename $file .svg)"
        base="$(basename $file .svgz)"
        mkdir -vp "${size}x${size}/$dir"
        rsvg-convert --height="${size}" --width="${size}" "$file" \
            --format=png --output "${size}x${size}/$dir/$base.png"
    done
done