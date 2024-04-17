#!/bin/bash/

package=$1
userid=$(id -u)

if [ $userid != 0 ]
then
    echo "please run $package package with super user access"
    exit 1
else
    dnf install $package -y | cat /c/users/surya/Desktop/Devops/repos/shell-script/status
    echo "installation of $package package is Success" | mutt -a "/c/users/surya/Desktop/Devops/repos/shell-script/status" -s "install status" maladikrishnakishore@gmail.com
fi