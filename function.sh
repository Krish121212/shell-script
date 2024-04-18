#!/bin/bash/

userid=$(id -u)

VALIDATE(){
    echo "Exit status: $1"
    echo "Installing: $2"
}

if [ $userid != 0 ]
then
    echo "please run mysql package with super user access"
    exit 1
else
    echo "you are super user"
fi

dnf install mysql -y
VALIDATE $? "Installing mysql"

dnf install nginx -y
VALIDATE $? "Installing nginx"