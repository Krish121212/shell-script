#!/bin/bash

SOURCE_DIR=/home/ec2-user/shell-script/source_dir/*
DESTINATION_DIR=/home/ec2-user/shell-script/destination_dir/
TIMESTAMP=$(date +%F-%H-%M-%S)
FILENAME=archive-$TIMESTAMP.tar.gz
OUTPUT=/tmp/archive-$TIMESTAMP.tar.gz
Green="\e[32m"
Nor="\e[0m"


tar -czvf $FILENAME $SOURCE_DIR &>>$OUTPUT
mv $FILENAME  $DESTINATION_DIR
echo -e "$Green Files in source dir have been archived and moved to destination dir $Nor"