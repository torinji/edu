#!/bin/bash
#dir=$1;
dir="./applicationHost.config"
src_site="29107"
while read conf_str; do
	if [[ $conf_str =~ ^\<site ]]; then
		name=$(echo $conf_str | awk -F\" '{ print $2 }')
		tmp_id=1
	elif [[ $conf_str =~ \<application ]]; then
		declare -A path[$tmp_id]=$(echo $conf_str | awk -F\" '{ print $2 }')
	elif [[ $conf_str =~ \<virtualDirectory ]]; then
		declare -A phys_path[$tmp_id]=$(echo $conf_str | awk -F\" '{ print $4 }')
	elif [[ $conf_str =~ \<\/application\> ]]; then
		let "tmp_id++"
	elif [[ $conf_str =~ \<binding.+.+\> ]]; then
		binding=$(echo $conf_str | awk -F\" '{ print $4 }')
	elif [[ $conf_str =~ \<\/site\> ]]; then
		if [[ "$name" =~ "$src_site" ]]; then
			echo -e "$binding\t:\t$name"
			for (( i=1; i<$tmp_id; i++ )); do
				echo -e "${path[$i]}\t:\t${phys_path[$i]}" 
			done
	                unset name path phys_path binding tmp_id
			echo
		fi
	fi
done < <( sed -n '/<site name=/,/<\/site>/p' "$dir" )

exit 0
