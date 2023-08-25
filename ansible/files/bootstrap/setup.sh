#!/bin/bash

# Set the path to the run.sh
RUN_PATH="/etc/ansible_pull_run.sh"

# Copy the script to the new location
[[ -f "$RUN_PATH" ]] && rm "$RUN_PATH"
cp "./run.sh" "$RUN_PATH"

# Set up a cron job to run the ansible-pull script
CRON_JOB="*/10 * * * *"  # Change this to the desired schedule (e.g., "@daily", "@hourly", "*/5 * * * *" for every 5 minutes)

# Add the cron job
(crontab -l ; echo "$CRON_JOB $RUN_PATH $1") | crontab -

echo "Cron job for ansible-pull scheduled"
