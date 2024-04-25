#!/bin/bash/

DISKUSAGE=$(df -hT | grep xfs)
THRESOULD=5

while IFS= read -r line
do 
    USAGE=$(echo $line | awk -F " " '{print $6f}' | cut -d "%" -f1)
    FOLDER=$(echo $line | awk -F " " '{print $7f}')
    if [ $USAGE -ge $THRESOULD ]
    then 
        echo "For $FOLDER    usage is more than $THRESOULD: current usage: $USAGE" 
    fi
done  <<< $DISKUSAGE