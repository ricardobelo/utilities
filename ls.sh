#ls -pr | grep -v /
ls -pr | grep -v / > ../${basename $(pwd)}.txt
