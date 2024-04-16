#!/bin/bash/

number=$1

if [ $number > 10 ]
then
    echo "entered $number is more than 10"
else [ $number < 10 ]
    echo "entered $number is less than 10"
fi