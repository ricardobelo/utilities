#!/bin/bash
for FILE in *.*; do mv "${FILE}" "${FILE:0:5}.$(echo ${FILE##*.} | tr '[:upper:]' '[:lower:]')" ; done
find . -type f -not -name "*.*" | while read FILE; do if [ $(file --mime-type -b "$FILE") == "image/heic" ]; then mv "$FILE" "$FILE".heic; fi; done;
for i in *.HEIC *.heic; do heif-convert "$i" "${i%.heic}.jpg"; done && for i in *.PNG *.png *.WEBP *.webp; do mogrify -format jpg "$i"; done
rm -rf *.PNG *.png *.HEIC *.heic *.WEBP *.webp 
mogrify -format jpg -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace RGB *.jpg
