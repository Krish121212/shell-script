#!/bin/bash/

userid=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d '.' -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
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

dnf install $install -y &>>$LOGFILE
Validate $? "Installing $install"

dnf install $install1 -y &>>$LOGFILE
Validate $? "Installing $install1"