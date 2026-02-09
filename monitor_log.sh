#!/bin/bash

LOG_FILE="/var/log/nginx/access.log"
SIZE=$(stat -c%s "$LOG_FILE")

# 1GB in bytes
MAX_SIZE=$((1*1024*1024*1024))

if [ "$SIZE" -ge "$MAX_SIZE" ]; then
  curl -X POST http://localhost:8080/job/UploadAccessLog/build \
  --user admin:JENKINS_API_TOKEN
fi
