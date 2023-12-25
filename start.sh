#!/bin/sh

USER_NAME=epg
GROUP_NAME=epg

echo "Generating user account"
if [ "$EPG_GID" == "" ]; then
	export EPG_GID=1500
fi
if [ "$EPG_UID" == "" ]; then
	export EPG_UID=1500
fi
addgroup -g $EPG_GID $GROUP_NAME
adduser -D -G $GROUP_NAME -u $EPG_UID $USER_NAME

echo "Enabling access to stdout/stderr"
chown $USER_NAME /dev/std*

if [ "$1" == "default" ]; then
	echo "Doing initial grab"
	su-exec epg npm run grab -- --channels=./custom_channels.xml --output "output/epg.xml"
	echo "Starting cronjob"
	su-exec epg npm run grab -- --channels=./custom_channels.xml --cron="13 */4 * * *"  --output "output/epg.xml"
else
	echo "Executing command"
	exec "$@"
fi
