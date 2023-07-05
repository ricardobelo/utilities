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

#for FILE in *.*; do mv "${FILE}" "${FILE:0:5}.$(echo ${FILE##*.} | tr '[:upper:]' '[:lower:]')" ; done
#for FILE in *.jpg ; do mv "${FILE}" "${FILE:0:5}.jpg" ; done
#rename -n 's/(.{5}).*(\.jpg)$/$1$2/' *.jpg
#IMG_[0-9]{4}.[a-Z]{3,4}
