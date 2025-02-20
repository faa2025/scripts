#!/bin/bash

# Hardcoded boolean value for testing (change to "false" to stop the script)
TEST_MODE="false"

# Path to the Python script to trigger
SCRIPT_TO_RUN="$HOME/object_detection/run_person_inference.py"

if [[ "$TEST_MODE" == "true" ]]; then
    # If true and script is not running, start it
    if ! pgrep -f "$SCRIPT_TO_RUN" > /dev/null; then
        echo "Starting object detection..."
        source venv/bin/activate && nohup python3 "$SCRIPT_TO_RUN" &>/dev/null & #nohup python3 "$SCRIPT_TO_RUN" &>/dev/null &
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
