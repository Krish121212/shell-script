#!/bin/bash/

package=$1
userid=$(id -u)

if [ $userid != 0 ]
then
    echo "please run this package with super user access"
fi
dnf install $package -y