#!/bin/bash
# Run every minute by launchd (as root).
# Battery <= LOW  -> allow normal sleep
# Battery >= HIGH -> keep awake with lid closed
# In between      -> leave as is
LOW=20
HIGH=50
LOG=/var/log/lid-awake.log

pct=$(pmset -g batt | grep -o '[0-9]*%' | head -1 | tr -d %)
[ -z "$pct" ] && exit 0
current=$(pmset -g | awk '/SleepDisabled/ {print $2}')

if [ "$pct" -le "$LOW" ] && [ "$current" = "1" ]; then
  pmset -a disablesleep 0
  echo "$(date '+%F %T') battery ${pct}% -> sleep allowed" >> "$LOG"
elif [ "$pct" -ge "$HIGH" ] && [ "$current" != "1" ]; then
  pmset -a disablesleep 1
  echo "$(date '+%F %T') battery ${pct}% -> staying awake" >> "$LOG"
fi
