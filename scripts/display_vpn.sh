#!/usr/bin/env bash

# Check if we're on the corp wifi
network_name=$( /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --getinfo | grep -E '\bSSID:' | cut -d: -f2- | sed -E -e 's/^ (.+)/\1/' )

if netstat -nr -f inet | grep utun1 > /dev/null; then
	echo "#[bg=colour70,fg=colour255] VPN "
elif [[ $network_name == "wpa2" ]]; then
	echo "#[bg=colour0,fg=colour75] WiFi "
else
	echo "#[bg=colour214,fg=colour240] VPN "
fi
