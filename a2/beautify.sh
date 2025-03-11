#!/bin/bash

delimiter=","
num_lines="5"
while [[ $# -gt 1 ]]; do
	if [[ $1 == -d* ]]; then
		delimiter=${1:2}
		echo "the delimiter is ${delimiter}"
	elif [[ $1 == -n* ]]; then
		num_lines=${1:2}
		echo "the number of lines is ${num_lines}"
	fi
	shift
done

path=$1
echo "the path is ${path}"
# add error checking later

header=$(head -n 1 ${path})
count=1  # Start with 1 because there's always one more column than delimiters
string="1"

for ((i = 0; i < ${#header}; i++)); do
    if [[ "${header:$i:1}" == "$delimiter" ]]; then
        ((count++))
	string+="${delimiter}${count}"
    fi
done

echo ${string}

(echo ${string}; head -n ${num_lines} ${path}) | column -t -s${delimiter} | less -S

