#!/bin/bash

# Directories
SOURCE_DIR="$HOME/video_clips"
DEST_DIR="$HOME/video_clips_zipped"
LOG_FILE="$HOME/archive_old_files.log"

# Ensure the destination directory exists
mkdir -p "$DEST_DIR"

# Generate unique zip filename
ZIP_FILE="$DEST_DIR/archive_$(date +%Y-%m-%d_%H-%M-%S).zip"

# Find and move old files into the zip
find "$SOURCE_DIR" -type f -mtime +30 -print0 | xargs -0 zip -m "$ZIP_FILE" >> "$LOG_FILE" 2>&1

# Log completion time
echo "Archiving completed at $(date) - Archive created: $ZIP_FILE" >> "$LOG_FILE"


# Make this script executable:
# chmod 755 archive_old_files.sh

# Schedule this script in crontab -e to run dauly at 4 AM:
# 0 4 * * * /path/to/archive_old_files.sh
