#!/bin/bash

LOG_FILE="/var/log/nginx/access.log"
MAX_SIZE=$((1024 * 1024 * 1024))   # 1GB in bytes

JENKINS_URL="http://localhost:8080"
JOB_NAME="UploadAccessLog"
USER="dipali"
TOKEN="11d27453e037ccea7f0c52c678c6202fb6"

LOG_SIZE=$(stat -c%s "$LOG_FILE")

if [ "$LOG_SIZE" -ge "$MAX_SIZE" ]; then
  echo "Log size exceeded 1GB. Triggering Jenkins job..."

  curl -X POST "$JENKINS_URL/job/$JOB_NAME/build" \
       --user "$USER:$TOKEN"
else
  echo "Log size under limit: $LOG_SIZE bytes"
fi
