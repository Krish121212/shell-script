#!/bin/bash/

userid=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d '.' -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
install=$1
install1=$2
Red="\e[31m"
Green="\e[32m"
Nor="\e[0m"
Validate(){
if [ $userid != 0 ]
then
    echo -e "please run package with super user access: $Red FAILURE $Nor"
    exit 1
else
    echo -e "you are super user: $Green SUCCESS $Nor"
fi
}

dnf install $install -y 
Validate $? echo -e "Installing $install: $Green SUCCESS $Nor"

dnf install $install1 -y 
Validate $? echo -e "Installing $install1: $Green SUCCESS $Nor"