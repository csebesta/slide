#!/bin/bash
# Script to populate home directory
# Written by Chad Sebesta

# Directories to create
DIRECTORIES="
	Desktop
	Documents
	Downloads
	Pictures
	Videos
	"

# Make directories
for directory in $DIRECTORIES; do

	# Make directory and output message
	mkdir "$HOME/$directory" > /dev/null 2>&1 \
	&& echo "$directory created" \
	|| echo "$directory already exists"

done
