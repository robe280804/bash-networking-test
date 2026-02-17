#!/bin/bash

source ./config.sh

# -- Create log file --
mkdir -p "$LOG_DIR" && touch "$LOG_FILE"
echo "Log file located at: $LOG_FILE"

TIMESTAMP=$(date "$DATE_FORMAT")

# -- Header injection --
echo "[$TIMESTAMP] Testing header injection" | tee -a "$LOG_FILE"

curl -s -o /dev/null -H "X-Test: injected\nFake-Header: evil" "http://$SERVER_IP:$SERVER_PORT" -w "HTTP code: %{http_code}\n" | tee -a "$LOG_FILE"
