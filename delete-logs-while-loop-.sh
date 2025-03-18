#!/bin/bash

source_directory=/tmp/

Red="\e[31m"
Green="\e[32m"
Nor="\e[0m"

if [ -d $source_directory ]
then
    echo -e "$Green source directory exists $Nor"
else
    echo -e "$Red source dirctory doesn't exists $Nor"
    exit 1
fi

files=$(find "$source_directory" -type f -name "*.log" -mtime +10)

while IFS= read -r line
do
    echo "Deleting files: $line"
    rm -rf $line
done <<< $files