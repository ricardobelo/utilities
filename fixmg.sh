#!/bin/bash

#salve names
## ls -pr | grep -v / > ../$(basename $(pwd)).txt
ls -pr | grep -v / | sed -E 's/_[^_]*$//' | sed -E 's/(.*)\..*/\1/' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2)); print}' > ../$(basename $(pwd)).txt


#rename
find . -maxdepth 1 -type f -exec sh -c 'newname=$(echo "$0" | tr -cd "[:digit:]_-" | cut -c1-5); newname=$(echo "$newname" | sed -e "s/[-_]*$//" -e "s/^[-_]*//"); [ "$newname" != "$0" ] && [ -n "$newname" ] && [ ! -e "$newname" ] && mv "$0" "$newname"' {} \;

#find_extension
find . -type f -exec sh -c 'mime_type=$(file --mime-type -b "$0"); case "$mime_type" in "image/jpeg") new_extension=".jpg" ;; "image/heic") new_extension=".heic" ;; "image/png") new_extension=".png" ;; "image/webp") new_extension=".webp" ;; *) new_extension=".outro" ;; esac; filename=$(basename "$0"); extension="${filename##*.}"; [ "$extension" != "${new_extension#.}" ] && new_filename="${filename%.*}$new_extension" && mv "$0" "$(dirname "$0")/$new_filename"' {} \;

#for i in *.HEIC *.heic; do heif-convert "$i" "${i%.heic}.jpg"; done && for i in *.PNG *.png *.WEBP *.webp; do mogrify -format jpg "$i"; done
#rm -rf *.PNG *.png *.HEIC *.heic *.WEBP *.webp 
#mogrify -format jpg -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace RGB *.jpg

#### mail 
grep -Eo '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' file.csv | sort -u > valids.txt

#### check duplicate numbers
ls | grep -oE '[0-9]+' | sort | uniq -d

### Donwload Dir File
grep -oP '(?<=href=")[^"]*' ../95.html | xargs -n 1 -I {} curl -O {}

### Rename character space %20
find . -type f -name '*%20*' -exec bash -c 'mv "$0" "${0//%20/ }"' {} \;


####### all in one
ls -pr | grep -v / | sed -E 's/_[^_]*$//' | sed -E 's/(.*)\..*/\1/' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2)); print}' > ../$(basename $(pwd)).txt; find . -maxdepth 1 -type f -exec sh -c 'newname=$(echo "$0" | tr -cd "[:digit:]_-" | cut -c1-5); newname=$(echo "$newname" | sed -e "s/[-_]*$//" -e "s/^[-_]*//"); [ "$newname" != "$0" ] && [ -n "$newname" ] && [ ! -e "$newname" ] && mv "$0" "$newname"' {} \;; find . -type f -exec sh -c 'mime_type=$(file --mime-type -b "$0"); case "$mime_type" in "image/jpeg") new_extension=".jpg" ;; "image/heic") new_extension=".heic" ;; "image/png") new_extension=".png" ;; "image/webp") new_extension=".webp" ;; *) new_extension=".outro" ;; esac; filename=$(basename "$0"); extension="${filename##*.}"; [ "$extension" != "${new_extension#.}" ] && new_filename="${filename%.*}$new_extension" && mv "$0" "$(dirname "$0")/$new_filename"' {} \;

#### w sort
ls -pr | grep -v / | sed -E 's/_[^_]*$//' | sed -E 's/(.*)\..*/\1/' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2)); print}' | sort > ../$(basename $(pwd)).txt; find . -maxdepth 1 -type f -exec sh -c 'newname=$(echo "$0" | tr -cd "[:digit:]_-" | cut -c1-5); newname=$(echo "$newname" | sed -e "s/[-_]*$//" -e "s/^[-_]*//"); [ "$newname" != "$0" ] && [ -n "$newname" ] && [ ! -e "$newname" ] && mv "$0" "$newname"' {} \;; find . -type f -exec sh -c 'mime_type=$(file --mime-type -b "$0"); case "$mime_type" in "image/jpeg") new_extension=".jpg" ;; "image/heic") new_extension=".heic" ;; "image/png") new_extension=".png" ;; "image/webp") new_extension=".webp" ;; *) new_extension=".outro" ;; esac; filename=$(basename "$0"); extension="${filename##*.}"; [ "$extension" != "${new_extension#.}" ] && new_filename="${filename%.*}$new_extension" && mv "$0" "$(dirname "$0")/$new_filename"' {} \;



