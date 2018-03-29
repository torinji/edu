#!/bin/bash

#вызов справки
function help {
	echo "useage: ./task10.3.sh old_type new_type [path]"
	echo "		new_type and old_type need write without dot"
	echo "example: ./task10.3.sh txt new.txt"
	exit 1;
}
#Проверка ключа
case $1 in
	--help)
		help
		;;
esac 
WORKDIR='./'
dir=${3:-$WORKDIR}
old_type=".$1"
new_type=".$2"
echo "find "$dir" -type f -name *"$old_type""
while read fname; do
# ${string%substring} — удаляет кратчайшее вхождение подстроки $substring в конце строки $string.
# $ fullpathname="/root/temp/file.tar.gz"; echo "${fullpathname%.*}"
# /root/temp/file.tar
	newFileName="${fname%$old_type}$new_type"
	echo "old file: $fname"
	echo "new file: $newFileName"
	if [ -e "$newFileName" ]; then
		echo "can't rewrite: file $newFileName exist"
	else
		mv "$fname" "$newFileName"
	fi
done < <(find "$dir" -type f -name *"$old_type")
exit 0

