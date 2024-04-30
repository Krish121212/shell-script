#!/bin/bash/

Top5=$()

while IFS= read -r line
do
    if [ $line = 0 ] 
    then
        echo "mail script"
    fi
done <<< $data.txt