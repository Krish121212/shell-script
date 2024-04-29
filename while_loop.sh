#!/bin/bash/


while IFS= read -r line
do
    if [ $line != ip-172-31-16-134.ec2.internal ] 
    then
        echo "mail script"
    fi
done <<< $data.txt