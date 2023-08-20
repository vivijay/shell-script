#!/bin/bash

APP_LOGS_DIR=/home/centos/app-logs
DATE=$(date +%F)
LOGSDIR=/home/centos/shell-script.logs
LOGFILE=$LOGSDIR/$SCRIPTNAME.log
SCRIPTNAME=$0
FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +14)
echo "$APP_LOGS_DIR"
