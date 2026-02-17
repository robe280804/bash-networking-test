#!/bin/bash


# -- Configuration --
SERVER_IP="172.19.76.54"
SERVER_PORT="8000"
LOG_DIR="/home/roberto-dev/BashProject/networking-test"
LOG_FILE="${LOG_DIR}/network.log"

# -- Create log file --
mkdir -p "$LOG_DIR" && touch "$LOG_FILE"
echo "Log file located at: $LOG_FILE"

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# -- Curl to server --
# -o /dev/null = no html saved
# -s = silent mode
# -o = custom output
response=$(curl -o /dev/null -s -w "%{http_code} %{time_total}" "http://$SERVER_IP:$SERVER_PORT")

# awk = take a column
status=$(echo "$response" | awk '{print $1}')
time_total=$(echo "$response" | awk '{print $2}')


# -- Connection error --
if [ "$status" -eq 000 ]; then
	echo "[$TIMESTAMP] Error - Server not reachable, connection failed" | tee -a "$LOG_FILE"
	exit 1
fi


# -- Http error
if [ "$status" -ne 200 ]; then
	echo "[$TIMESTAMP] Warning - Status: $status | Time: $time_total" | tee -a "$LOG_FILE"
fi

echo "[$TIMESTAMP] Ok - Status: $status | Time: $time_total" | tee -a "$LOG_FILE"
