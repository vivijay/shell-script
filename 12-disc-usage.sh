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
MESSAGE=

## IFS means internal field separator is space
while IFS= read Line
do
    usage=$(echo $line | awk '{print $6}' | cut -d % -f1)
    partition=$(echo $line | awk '{print $1}')
    if [ $usage -gt $DISC_USAGE_THRESOLD ]
    then
        MESSAGE+= "High disc usage on $partition with $usage"
    fi
done <<< $DISC_USAGE

echo "MESSAGE= $MESSAGE"