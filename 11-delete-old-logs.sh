#!/bin/bash

APP_LOGS_DIR=/home/centos/app-logs
DATE=$(date +%F)
LOGSDIR=/home/centos/shell-script.logs
SCRIPTNAME=$0
LOGFILE=$LOGSDIR/$SCRIPTNAME.log
FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +14)
echo "$FILES_TO_DELETE"

while read line
do
## what you want to do 
echo "Deleting $line" &> $LOGFILE 
rm -rf 
done >$FILES_TO_DELETE
