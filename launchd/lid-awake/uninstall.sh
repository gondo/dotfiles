#!/bin/bash
# usage: sudo ./uninstall.sh
launchctl bootout system/com.lid-awake 2>/dev/null || true
rm -f /Library/LaunchDaemons/com.lid-awake.plist /usr/local/bin/lid-awake.sh
pmset -a disablesleep 0
echo "Uninstalled, normal sleep restored."
