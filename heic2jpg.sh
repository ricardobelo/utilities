#!/bin/bash
#find . -type f -not -name "*.*" -exec bash -c 'if [ $(file --mime-type -b {}) == "image/heic" ]; then mv {} {}.heic; fi;' \;
find . -type f -not -name "*.*" | while read FILE; do if [ $(file --mime-type -b "$FILE") == "image/heic" ]; then mv "$FILE" "$FILE".heic; fi; done;
for i in *.HEIC *.heic; do heif-convert "$i" "${i%.heic}.jpg"; done
for i in *.PNG *.png .HEIC *.heic *.WEBP *.webp; do mogrify -format jpg "$i"; done
rm -rf *.PNG *.png .HEIC *.heic *.WEBP *.webp 
#mogrify -format jpg *.PNG *.png .HEIC *.heic *.WEBP *.webp
