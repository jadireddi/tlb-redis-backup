#!/usr/bin/env bash

# Set cron backup schedule if we're given a cron time or take one time backup.
if [ -n "${CRON_TIME}" ]; then
    exec /cron_backups.sh
else
    exec /backup.sh
fi

