#!/bin/bash
vol=$( amixer sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }' | awk -F% '{ print $1 }' )
muted=$( pacmd list-sinks | grep "muted" | awk '/muted/ {print $2}' )
str="yes"
if [[ vol -eq 0 ]] || [ "$muted" == "$str" ];
	then
		vol=" Mute"
	elif (( vol <= 50 )); then
		vol=" $vol%"
	else
		vol=" $vol%"
fi

echo $vol
