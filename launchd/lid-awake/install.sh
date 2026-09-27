#!/bin/bash
# usage: sudo ./install.sh
set -e
cd "$(dirname "$0")"
install -o root -g wheel -m 755 lid-awake.sh /usr/local/bin/lid-awake.sh
install -o root -g wheel -m 644 com.lid-awake.plist /Library/LaunchDaemons/com.lid-awake.plist
launchctl bootout system/com.lid-awake 2>/dev/null || true
launchctl bootstrap system /Library/LaunchDaemons/com.lid-awake.plist
echo "Installed. Status: $(pmset -g | awk '/SleepDisabled/ {print "SleepDisabled=" $2}')"
