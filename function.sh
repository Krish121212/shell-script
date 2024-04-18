#!/bin/bash/

userid=$(id -u)

Validate(){
if [ $userid != 0 ]
then
    echo "please run package with super user access: failure"
    exit 1
else
    echo "you are super user: success"
fi
}

dnf install mysql -y
Validate $? "Installing"

dnf install nginx -y
Validate $? "Installing"