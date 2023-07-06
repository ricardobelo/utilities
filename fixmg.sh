#!/bin/bash
#rename
for file in *; do
  newname=$(echo "$file" | tr -cd '[:digit:]_-')
  newname=$(echo $newname | sed -e 's/[-_]*$//' -e 's/^[-_]*//')
  if [ "$newname" != "$file" ] && [ -n "$newname" ] && [ ! -e "$newname" ]; then
    if [ -e "$newname" ]; then
      echo "O arquivo $newname já existe. Ignorando a renomeação do arquivo $file."
    else
      mv "$file" "$newname"
    fi
  fi
done
#find_extension
find . -type f | while read FILE; do
    mime_type=$(file --mime-type -b "$FILE")

    case "$mime_type" in
        "image/jpeg") new_extension=".jpg" ;;
        "image/heic") new_extension=".heic" ;;
        "image/png") new_extension=".png" ;;
        *) new_extension=".outro" ;;  # Extensão padrão para tipos MIME desconhecidos
    esac

    filename=$(basename "$FILE")
    extension="${filename##*.}"

    if [ "$extension" != "${new_extension#.}" ]; then
        new_filename="${filename%.*}$new_extension"
        mv "$FILE" "$(dirname "$FILE")/$new_filename"
    fi
done


for i in *.HEIC *.heic; do heif-convert "$i" "${i%.heic}.jpg"; done && for i in *.PNG *.png *.WEBP *.webp; do mogrify -format jpg "$i"; done
rm -rf *.PNG *.png *.HEIC *.heic *.WEBP *.webp 
mogrify -format jpg -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace RGB *.jpg
