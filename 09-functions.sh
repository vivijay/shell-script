#!/bin/bash

USERID=$(id -u)


validate(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is failure"
        exit 1
    else 
        echo "$2 is Success"
    fi
}

if [ $USERID -ne 0 ]
then

echo "Please run this script with root acces"
exit 1

fi

yum install sql -y 

validate $? "Sql installation"

yum install postfix -y

validate $? "Postfix installation"

