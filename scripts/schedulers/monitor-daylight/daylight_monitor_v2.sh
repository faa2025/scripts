#!/bin/bash

# This script triggers "object_detection.py" based on daylight status. Daylight status is fetched from SpringBoot app. 

# API Endpoint of your Spring Boot application
API_URL="http://localhost:8080/api/daylight"  #Replace with "http://our-deployed-backend-URL/api/daylight"

# Path to the Python script to run
SCRIPT_TO_RUN="./object_detection.py"

# Check API response
response=$(curl -s "$API_URL")

if [[ "$response" == "true" ]]; then
    # If true and script is not running, start it
    if ! pgrep -f "$SCRIPT_TO_RUN" > /dev/null; then
        echo "Starting object detection..."
        nohup python3 "$SCRIPT_TO_RUN" &>/dev/null &  #venv?: "source /path/to/venv/bin/activate && nohup python3 "$SCRIPT_TO_RUN" &>/dev/null &"
    else
        echo "Object detection is already running."
    fi
else
    # If false and script is running, stop it
    if pgrep -f "$SCRIPT_TO_RUN" > /dev/null; then
        echo "Stopping object detection..."
        pkill -f "$SCRIPT_TO_RUN"
    else
        echo "Object detection is not running."
    fi
fi
