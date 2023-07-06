#!/bin/bash
#rename/find_extension
find "$(pwd)" -type f -exec sh -c '
    file="$0"
    newname=$(echo "$file" | tr -cd "[:digit:]_-")
    newname=$(echo "$newname" | sed -e "s/[-_]*$//" -e "s/^[-_]*//")
    [ "$newname" != "$file" ] && [ -n "$newname" ] && [ ! -e "$newname" ] && mv "$file" "$newname"

    mime_type=$(file --mime-type -b "$file")
    case "$mime_type" in
        "image/jpeg") new_extension=".jpg" ;;
        "image/heic") new_extension=".heic" ;;
        "image/png") new_extension=".png" ;;
        *) new_extension=".outro" ;;
    esac
    filename=$(basename "$file")
    extension="${filename##*.}"
    [ "$extension" != "${new_extension#.}" ] && new_filename="${filename%.*}$new_extension" && mv "$file" "$(dirname "$file")/$new_filename"
' {} \;

for i in *.HEIC *.heic; do heif-convert "$i" "${i%.heic}.jpg"; done && for i in *.PNG *.png *.WEBP *.webp; do mogrify -format jpg "$i"; done
rm -rf *.PNG *.png *.HEIC *.heic *.WEBP *.webp 
mogrify -format jpg -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace RGB *.jpg
