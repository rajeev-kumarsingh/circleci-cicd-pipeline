#Application Start
#!/bin/bash
set i 
echo "Starting Application"
APP_DIR = "/home/ubuntu/react-app"
PORT = 5000
cd $APP_DIR
nohup npm serve -s $APP_DIR -l $PORT
echo "App Stored"
