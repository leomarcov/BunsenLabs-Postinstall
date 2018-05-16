#!/bin/bash
#===================================================================================
# AUTOSNAP
# FILE: autosnap.sh
# USAGE: autosnap.sh
# DESCRIPTION: Snap current windows according the mouse position
# REQUIREMENTS: xdotool, xrandr
# AUTHOR: Leonardo Marco
# VERSION: 1.0
# CREATED: 12.10.2017 
# LAST-UPDATE: 12.10.2017
#===================================================================================

# Key combinations in openbox (same as configured in rc.xml)
topleft_key="ctrl+KP_Home"
top_key="ctrl+KP_Up"
topright_key="ctrl+KP_Prior"
left_key="ctrl+KP_Left"
center_key="ctrl+KP_Begin"
right_key="ctrl+KP_Right"
bottomleft_key="ctrl+KP_End"
bottom_key="ctrl+KP_Down"
bottomright_key="ctrl+KP_Next"

# Format xrandr output
xrandr="$(xrandr | grep -w "connected" | grep -o "[0-9]\+x[0-9]\++[0-9]\++[0-9]\+" | tr "x+" " " | sort -nk 4)"
# Get num of monitors
num_screens=$(echo "$xrandr" |  wc -l)
[ "$num_screens" -gt 2 ] && echo "Script cannot deal with more than 2 monitors" >&2 && exit 1
# Get screen resolution
screen_left=($(echo "$xrandr" | head -1))
[ "$num_screens" -gt 1 ] && screen_right=($(echo "$xrandr" | tail -1))

# Get current mouse position
out="$(xdotool getmouselocation)"
out=(${out//[^0-9 ]/})
current_x="${out[0]}"
current_y="${out[1]}"

# Calculate current monitor and relative position to this monitor
if [ "$num_screens" -gt 1 ] && [ "$current_x" -gt "${screen_right[2]}" ]; then
	current_screen=(${screen_right[*]})
	current_x=$(($current_x-${screen_right[2]}))
else 
	current_screen=(${screen_left[*]})
fi

# Check zone-position
if [ "$current_y" -lt "$((${current_screen[1]}*1/4))" ]; then # IN-TOP
	var_key="top"
elif [ "$current_y" -gt "$((${current_screen[1]}*3/4))" ]; then # IN-BOTTOM
	var_key="bottom"
fi
if [ "$current_x" -lt "$((${current_screen[0]}*1/4))" ]; then # IN-LEFT
	var_key="${var_key}left"
elif [ "$current_x" -gt "$((${current_screen[0]}*3/4))" ]; then # IN-RIGHT
	var_key="${var_key}right"
fi
[ ! "$var_key" ] && var_key="center"
var_key="${var_key}_key"

# Press openbox snap combination according position
xdotool key "${!var_key}"
