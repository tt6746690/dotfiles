#!/bin/bash

# https://chatgpt.com/share/687bcec8-f758-8013-a54e-f556052b732b
# create launchd and save to ~/Library/LaunchAgents/com.1point3acres.dailyjob.plist

LOG_FILE="/tmp/1point3acres.log"
STAMP_FILE="/tmp/.1point3acres_last_run"
TODAY=$(date +%F)

# Only run once per day
if [[ -f "$STAMP_FILE" && $(cat "$STAMP_FILE") == "$TODAY" ]]; then
  exit 0
fi

# Run the command
source ~/.profile
conda activate 1point3acres
cd ~/github/1point3acres/src || exit 1
python3.12 service.py >> "$LOG_FILE" 2>&1

# Record the date
echo "$TODAY" > "$STAMP_FILE"
