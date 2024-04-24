#!/bin/bash/

SOURCE_DIR=/home/ec2-user/shell-script/source_dir
DESTINATION_DIR=/home/ec2-user/shell-script/destination_dir/
TIMESTAMP=$(date +%F-%H-%M-%S)
FILENAME=archive-$TIMESTAMP.tar.gz


tar -czvf $FILENAME $SOURCE_DIR
mv -t $SOURCE_DIR/$FILENAME  $DESTINATION_DIR