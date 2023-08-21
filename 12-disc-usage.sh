#!/bin/bash
LOGS_DIR=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPTNAME=$0
LOGFILE=$LOGS_DIR/$SCRIPTNAME-$DATE.log
R="\e[31m"
N="\e[0m"
G="\e[32m"

DISC_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISC_USAGE_THRESOLD=1

while IFS= read Line
do
    echo "Output: $Line"
done <<< $DISC_USAGE

