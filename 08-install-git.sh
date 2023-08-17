#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then

echo "Please run this script with root acces"
exit 1

fi

yum install sql -y 

if [ $? -ne 0 ]
then
    echo "Installation is failure"
else 
    echo "Installation is Success"
fi