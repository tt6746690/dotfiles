#!/bin/bash

LOGFILE="/tmp/1point3acres.log"
STAMPFILE="/tmp/1point3acres_last_run.txt"

# Only run once per day
TODAY=$(date +%Y-%m-%d)
LAST_RUN=$(cat "$STAMPFILE" 2>/dev/null)

echo $LAST_RUN

if [[ "$TODAY" != "$LAST_RUN" ]]; then
    source ~/.profile
    conda activate 1point3acres
    cd ~/github/1point3acres/src
    python3.12 service.py >> "$LOGFILE" 2>&1
    echo "$TODAY" > "$STAMPFILE"
fi
