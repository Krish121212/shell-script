#!/bin/bash/

SOURCE_DIR=/home/ec2-user/shell-script/source_dir/
DESTINATION_DIR=/home/ec2-user/shell-script/destination_dir/
TIMESTAMP=$(date +%F-%H-%M-%S)


tar -czvf archive-$TIMESTAMP.tar.gz $SOURCE_DIR
mv $SOURCE_DIRarchive-$TIMESTAMP.tar.gz  $DESTINATION_DIR