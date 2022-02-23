#!/bin/bash
find . -type f -not -name "*.*" -exec bash -c 'if [ $(file --mime-type -b {}) == "image/heic" ]; then mv {} {}.heic; fi;' \;
for i in *.heic; do heif-convert "$i" "${i%.heic}.jpg"; done
rm -rf *.heic
