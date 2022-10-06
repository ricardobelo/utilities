for FILE in *.*; do mv "${FILE}" "${FILE:0:5}.$(echo ${FILE##*.} | tr '[:upper:]' '[:lower:]')" ; done
#for FILE in *.jpg ; do mv "${FILE}" "${FILE:0:5}.jpg" ; done
#rename -n 's/(.{5}).*(\.jpg)$/$1$2/' *.jpg
#IMG_[0-9]{4}.[a-Z]{3,4}
