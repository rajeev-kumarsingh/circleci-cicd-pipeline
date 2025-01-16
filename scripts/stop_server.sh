#!/bin/bash

#set errors if any command is not execute successfully
set e 
echo "Appliction stop is underway...."
#application dir 
APP_DIR = "/home/ubuntu/react-app"
# Port on which our app is running
PORT = 5000
# find process id 
PID = $(lsof -t -i:$PORT || true)
#
if [ -n "$PID" ]; then;
echo "Killing Process"
kill -9 $PID
fi

echo "Application Stopped"

