#!/bin/bash

USERID=$(id -u)
R="\e[31m"
N="\e[0m"
G="\e[32m"
DATE=$(date)
SCRIPTNAME=$0
LOGSDIR=/home/centos/shellscript-logs
LOGFILE=$LOGSDIR/$SCRIPTNAME-$DATE.log

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R Error .. $2 Not installled "
    else
        echo -e " $G Sucess..$2 is Installed"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "$R Error : Please run this script with root access $N"
    exit 1
fi

#all args in $@
for i in $@
do
    yum list installed $i &>>$LOGFILE
    if [ $? -ne 0 ]
    then
        echo " $i is not installed . lets install it "
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "$i"
    else
         echo -e "$i is already installed "
    fi
done