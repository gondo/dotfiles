#!/bin/bash
# Run every minute by launchd (as root).
# Battery <= LOW  → allow normal sleep
# Battery >= HIGH → keep awake with lid closed
# In between      → leave as is
LOW=20
HIGH=50
LOG=/var/log/lid-awake.log

pct=$(pmset -g batt | grep -o '[0-9]*%' | head -1 | tr -d %)
[ -z "$pct" ] && exit 0
sleep_disabled=$(pmset -g | awk '/SleepDisabled/ {print $2}')

if [ "$pct" -le "$LOW" ] && [ "$sleep_disabled" = "1" ]; then
  pmset -a disablesleep 0
  echo "$(date '+%F %T') battery ${pct}% → sleep allowed" >> "$LOG"
elif [ "$pct" -ge "$HIGH" ] && [ "$sleep_disabled" != "1" ]; then
  pmset -a disablesleep 1
  echo "$(date '+%F %T') battery ${pct}% → staying awake" >> "$LOG"
  sleep_disabled=1
fi

# With sleep disabled, closing the lid leaves the screen on. Turn it off
# (this also locks the screen); opening the lid wakes it automatically.
lid=$(ioreg -r -k AppleClamshellState -d 4 | awk '/"AppleClamshellState"/ {print $NF; exit}')
locked=$(ioreg -n Root -d 1 | awk -F'= ' '/"IOConsoleLocked"/ {gsub(/"/, "", $2); print $2; exit}')
if [ "$lid" = "Yes" ] && [ "$sleep_disabled" = "1" ] && [ "$locked" = "No" ]; then
  pmset displaysleepnow
  echo "$(date '+%F %T') display → sleeping" >> "$LOG"
fi
