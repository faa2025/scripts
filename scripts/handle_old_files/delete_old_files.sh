#!/bin/bash

# Directory containing the files
TARGET_DIR="$HOME/video_clips"
LOG_FILE="$HOME/delete_old_files.log"

# Find and delete files older than 30 days
find "$TARGET_DIR" -type f -mtime +30 -exec rm -v {} \; >> "$LOG_FILE" 2>&1

# Log completion time
echo "Cleanup completed at $(date)" >> "$LOG_FILE"

# Change perms to enable execution:
# chmod 755 delete_old_files.sh

# Schedule it in crontab -e to run daily at 3 AM:
# 0 3 * * * /path/to/delete_old_files.sh
