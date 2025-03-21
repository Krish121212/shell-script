#!/bin/bash

userid=$(id -u)
install=$1
install1=$2

Validate(){
if [ $userid != 0 ]
then
    echo "please run package with super user access: failure"
    exit 1
else
    echo "you are super user: success"
fi
}

dnf install $install -y
Validate $? "Installing $install"

dnf install $install1 -y
Validate $? "Installing $install1"