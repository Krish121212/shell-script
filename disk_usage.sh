#!/bin/bash/

DISKUSAGE=$(df -hT | grep xfs)
THRESOULD=5
MESSAGE=""

while IFS= read -r line
do 
    USAGE=$(echo $line | awk -F " " '{print $6f}' | cut -d "%" -f1)
    FOLDER=$(echo $line | awk -F " " '{print $7f}')
    if [ $USAGE -ge $THRESOULD ]
    then 
        MESSAGE+="For $FOLDER usage is more than $THRESOULD: current usage: $USAGE \n" 
    fi
done  <<< $DISKUSAGE

echo -e "MESSAGE=$MESSAGE"

echo "MESSAGE" | mail -s "subject" malladikrishnakishore@gmail.com

##session 14 unix shell