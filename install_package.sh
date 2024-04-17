#!/bin/bash/

package=$1
userid=$(id -u)

if [ $userid != 0 ]
then
    echo "please run $package package with super user access"
    exit 1
else
    dnf install $package -y | cat > status
    echo "installation of $package package is Success" | mpack -s "install status" -a "/c/users/surya/Desktop/Devops/repos/shell-script/status"  maladikrishnakishore@gmail.com
fi