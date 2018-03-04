#!/bin/bash
# Home directory configuration script
# Written by Chad Sebesta

SEP='----------'

# Check for broken symlinks in the home directory
# Not doing this may lead to conflicts while using stow
symlinkn=$(find -L $HOME -type l | wc -l)
echo "There are $symlinkn broken symlinks"

# Delete broken symlinks
if [[ $symlinkn -ne 0 ]]; then

	# Ask for confirmation
	read -p "Delete these broken symlinks (y/n)? "

	# Delete broken symlinks and print results
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		find -L $HOME -type l -printf "Deleting... %p\n" -delete
	else
		echo "No symlinks deleted"
	fi

fi

# Separator to make output easier to read
echo $SEP

# For every directory in the stow directory...
for d in */; do

	# Unstow directory before completing operations
	# This prevents the script from deleting the contents of the stow directory
	stow -D $d > /dev/null 2>&1

	# For every file within the program directory...
	# Delete the target file interactively if it already exists
	for f in $(find $d -type f); do
		i="$HOME/${f#*/}"
		if [ -f $i ]; then
			rm -rfi $i
		fi
	done

	# Stow the contents of the directory
	stow $d > /dev/null 2>&1 \
	&& echo "Stowed $d successfully" \
	|| echo "Failed to stow $d"

done
