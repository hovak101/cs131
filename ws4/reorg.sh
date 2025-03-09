#!/bin/bash
#explicitely create new ws4.txt so that it wipes existing info everytime
#this script is called.
touch ws4.txt

#for each of the vendor ids
for i in 1.0 2.0 4.0
do
	file_name="$(date "+%F-%T")-$i.csv"
	#find vendorid starting with $i and create new file with only those vendorids
	grep "^$i," ../ws3/2019-01-h1.csv > "$file_name"
	#add to gitignore
	echo "ws4/$file_name" >> ../.gitignore
	#add word counts to ws4.txt
	echo "$(wc "$file_name") $file_name" >> ws4.txt
done

#add output of cat gitignore to ws4
cat ../.gitignore >> ws4.txt


