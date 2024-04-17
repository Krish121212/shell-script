#!/bin/bash/

package=$1
userid=$(id -u)

if [ $userid != 0 ]
then
    echo "please run this package with super user access"
    exit 1
fi
dnf install $package -y

if [ $? != 0 ]
then
    echo "installation of $package package is failure"
fi