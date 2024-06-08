#!/bin/bash

userid=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d '.' -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log

echo "[jenkins]
name=Jenkins-stable
baseurl=http://pkg.jenkins.io/redhat-stable
gpgcheck=1" > /etc/yum.repos.d/jenkins.repo

if [ $userid != 0 ]
then
    echo "please run package with super user access: failure"
    exit 1
else
    echo "you are super user: success"
fi

cd /etc/yum.repos.d/
chmod 777 jenkins.repo

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key &>>$LOGFILE
dnf install fontconfig java-17-openjdk &>>$LOGFILE
dnf install jenkins &>>$LOGFILE
systemctl daemon-reload &>>$LOGFILE
systemctl enable jenkins
systemctl start jenkins
systemctl status jenkins
