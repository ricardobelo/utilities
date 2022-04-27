for FILE in *.jpg ; do mv "${FILE}" "${FILE:0:5}.jpg" ; done
rename -n 's/(.{5}).*(\.jpg)$/$1$2/' *.jpg
