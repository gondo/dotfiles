#!/bin/bash
# Run every minute by launchd (as root).
# Battery <= LOW  → allow normal sleep (and force it if the lid is already closed)
# Battery >= HIGH → keep awake with lid closed
# In between      → leave as is
LOW=20
HIGH=50
LOG=/var/log/lid-awake.log

batt=$(pmset -g batt)
pct=$(echo "$batt" | grep -o '[0-9]*%' | head -1 | tr -d %)
[ -z "$pct" ] && exit 0
sleep_disabled=$(pmset -g | awk '/SleepDisabled/ {print $2}')

if [ "$pct" -le "$LOW" ] && [ "$sleep_disabled" = "1" ]; then
  pmset -a disablesleep 0
  echo "$(date '+%F %T') battery ${pct}% → sleep allowed" >> "$LOG"
  sleep_disabled=0
elif [ "$pct" -ge "$HIGH" ] && [ "$sleep_disabled" != "1" ]; then
  pmset -a disablesleep 1
  echo "$(date '+%F %T') battery ${pct}% → staying awake" >> "$LOG"
  sleep_disabled=1
fi

lid=$(ioreg -r -k AppleClamshellState -d 4 | awk '/"AppleClamshellState"/ {print $NF; exit}')

# Clamshell sleep only fires on the lid-close event, so re-enabling sleep with
# the lid already shut does nothing. Force it while on battery; this also puts
# the Mac back to sleep if it wakes up (e.g. Power Nap) with low battery.
if [ "$pct" -le "$LOW" ] && [ "$lid" = "Yes" ] && echo "$batt" | grep -q "'Battery Power'"; then
  echo "$(date '+%F %T') battery ${pct}%, lid closed → sleeping now" >> "$LOG"
  pmset sleepnow
  exit 0
fi

# With sleep disabled, closing the lid leaves the screen on. Turn it off
# (this also locks the screen); opening the lid wakes it automatically.
locked=$(ioreg -n Root -d 1 | awk -F'= ' '/"IOConsoleLocked"/ {gsub(/"/, "", $2); print $2; exit}')
if [ "$lid" = "Yes" ] && [ "$sleep_disabled" = "1" ] && [ "$locked" = "No" ]; then
  pmset displaysleepnow
  echo "$(date '+%F %T') display → sleeping" >> "$LOG"
fi
