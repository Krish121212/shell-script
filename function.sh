#!/bin/bash/

userid=$(id -u)

if [ $userid != 0 ]
then
    echo "please run mysql package with super user access"
    exit 1
else
    echo "you are super user"
fi

VALIDATE(){
    if [ $1 != 0 ]
    then
        echo "$2 Failure"
        exit 1
    else
        echo "$2 Success"
    fi
}


dnf install mysql -y
VALIDATE $? "Installing mysql"

dnf install nginx -y
VALIDATE $? "Installing nginx"