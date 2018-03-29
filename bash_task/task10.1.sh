#!/bin/bash

dir="$1"
while read filename; do
	sed -i 's/http:\/\/www.mydomain.ru/http:\/\/mydomain.su/g ' $filename
done < <(find "$dir" -type f -name '*.txt')
