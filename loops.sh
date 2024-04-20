#!/bin/bash/

userid=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d '.' -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
Red="\e[31m"
Green="\e[32m"
Yellow="\e[33m"
Nor="\e[0m"

if [ $userid != 0 ]
then
    echo -e "please run package with super user access: $Red FAILURE $Nor"
    exit 1
else
    echo -e "you are super user: $Green SUCCESS $Nor"
fi

for i in $@
do
    echo "Package to install: $i"
    dnf list installed $i &>>$LOGFILE
    if [ $? = 0 ]
    then
        echo -e "Package is already installed : $Yellow SKIPPING $Nor"
    else
        dnf install $i -y &>>$LOGFILE
        echo -e "Package is instaling : $Green INSTALED $Nor"
    fi
done

    

