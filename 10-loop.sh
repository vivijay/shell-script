#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error : Please run this script with root access"
    exit 1
fi

#all args in $@
for i in $@
do
    yum install $i -y
done