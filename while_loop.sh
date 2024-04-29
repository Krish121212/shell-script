#!/bin/bash/


while IFS= read -r line
do
    if [ $line != 18.215.169.233 ] 
    then
        echo "mail script"
    fi
done <<< $data.txt