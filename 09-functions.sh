#!/bin/bash


DATE=$(date +%F:%H:%M:%S)
SCRIPTNAME=$0
LOGFILE=/tmp/$SCRIPTNAME-$DATE.log

validate(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is failure"
        exit 1
    else 
        echo "$2 is Success"
    fi
}

USERID=$(id -u)
if [ $USERID -ne 0 ]
then

echo "Please run this script with root acces"
exit 1

fi

yum install mysql -y &>>LOGFILE

validate $? "Sql installation"

yum install postfix -y &>>LOGFILE

validate $? "Postfix installation"

