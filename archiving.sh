#!/bin/bash/

SOURCE_DIR=/home/ec2-user/shell-script/source_dir
DESTINATION_DIR=/home/ec2-user/shell-script/destination_dir/
TIMESTAMP=$(date +%F-%H-%M-%S)
FILENAME=archive-$TIMESTAMP.tar.gz
OUTPUT=/tmp/archive-$TIMESTAMP.tar.gz


tar -czvf $FILENAME $SOURCE_DIR &>>$OUTPUT
mv $FILENAME  $DESTINATION_DIR
echo "Files in source dir have been archived and moved to destination dir"