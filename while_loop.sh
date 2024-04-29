#!/bin/bash/


while IFS= read -r line
do
    if [ $line != $pwd ] 
    then
        echo "mail script"
    fi
done <<< $data.txt