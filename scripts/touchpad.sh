#!/bin/bash
vol=$( xinput list | grep Touchpad | awk -F= '{print $2}' )
vol=${vol:0:2}
tapping=$( xinput list-props $vol | grep "Tapping Enabled (" )
tapping=${tapping:27:3}
scrolling=$( xinput list-props $vol | grep "Scrolling Enabled (" )
scrolling=${scrolling:37:3}
xinput set-prop $vol $tapping 1
xinput set-prop $vol $scrolling 1
