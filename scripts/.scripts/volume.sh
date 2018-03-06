#!/bin/bash
# Script to generate volume status for xmobar

# Get Master volume 
mixer=$(amixer get Master | grep 'Mono:')
muted=$(amixer get Master | grep 'Mono:' | cut -d ' ' -f 8)

# Generate output
if [ "$muted" == "[off]" ]; then
	echo "[--]"
else
	echo $mixer | cut -d ' ' -f 4
fi

