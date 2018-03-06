#!/bin/bash
# Script to populate home directory
# Written by Chad Sebesta

# Directories to create
DIRECTORIES="
	Desktop
	Documents
	Downloads
	Pictures
	Public
	Videos
	"

# Make directories
for directory in $DIRECTORIES; do

	if [[ -d "$HOME/$directory" ]]; then

		echo "$directory exists"

	else

		# Make directory and output message
		mkdir "$HOME/$directory" > /dev/null 2>&1 \
		&& echo "$directory created" \
		|| echo "$directory creation failed"

	fi

done
