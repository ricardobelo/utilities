#!/bin/bash
#salve names
ls -pr | grep -v / > ../$(basename $(pwd)).txt
#rename
find . -maxdepth 1 -type f -exec sh -c 'newname=$(echo "$0" | tr -cd "[:digit:]_-"); newname=$(echo "$newname" | sed -e "s/[-_]*$//" -e "s/^[-_]*//"); [ "$newname" != "$0" ] && [ -n "$newname" ] && [ ! -e "$newname" ] && mv "$0" "$newname"' {} \;
#find_extension
find . -type f -exec sh -c 'mime_type=$(file --mime-type -b "$0"); case "$mime_type" in "image/jpeg") new_extension=".jpg" ;; "image/heic") new_extension=".heic" ;; "image/png") new_extension=".png" ;; "image/webp") new_extension=".webp" ;; *) new_extension=".outro" ;; esac; filename=$(basename "$0"); extension="${filename##*.}"; [ "$extension" != "${new_extension#.}" ] && new_filename="${filename%.*}$new_extension" && mv "$0" "$(dirname "$0")/$new_filename"' {} \;

#for i in *.HEIC *.heic; do heif-convert "$i" "${i%.heic}.jpg"; done && for i in *.PNG *.png *.WEBP *.webp; do mogrify -format jpg "$i"; done
#rm -rf *.PNG *.png *.HEIC *.heic *.WEBP *.webp 
#mogrify -format jpg -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace RGB *.jpg
