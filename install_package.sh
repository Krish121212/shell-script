#!/bin/bash/

package=$1
userid=$(id -u)

if [ $userid != 0 ]
then
    echo "please run $package package with super user access"
    exit 1
else
    dnf remove $package -y
    echo "installation of $package package is Success"
fi