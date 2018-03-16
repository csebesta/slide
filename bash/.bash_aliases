#!/bin/bash
# ~/.bash_aliases: a file containing user added aliases

# Help aliases
alias info='info --vi-keys'

# Editor aliases
alias gi='vim -g'
alias vi='vim'

# Listing aliases
alias ls='ls --group-directories-first --color=always'
alias l.='ls -d .[!.]* --color=auto 2> /dev/null'
alias li='ls -li --color=auto'
alias ll='ls -l --color=auto'

# Reduce output of haskell compiler
alias ghc='ghc -hidir /tmp -odir /tmp'

# Sudo does not work with aliases without an additional space
alias sudo='sudo '

# Default to human readable outputs
alias df='df -h'
alias free='free -h'

# lf: A function to display an organized list of normal and hidden files.
# Useful for getting a quick read on certain directories
# Using ls --ignore=pattern solves many problems
lf () {

	# Declare directory
	if [ -d "$1" ]; then
		local dir="$(tput setaf 6)$(readlink -f $1)$(tput sgr 0)"
	elif [ "$#" -eq 0 ]; then
		local dir="$(tput setaf 6)$(pwd)$(tput sgr 0)"
	else
		echo "$(tput setaf 1)No dice, compadre$(tput sgr 0)"
		return 1
	fi

	# Display normal files
	echo "$(tput setaf 7)Normal Files: $dir:$(tput sgr 0)"
	NORMAL="$(ls -Cq --color=always $1)"
	if [ -z "$NORMAL" ]; then
		echo "$(tput setaf 1)(none)$(tput sgr 0)"
	else
		ls -Cq --color=always --group-directories-first $1
	fi

	# Display hidden files
	echo "$(tput setaf 7)Hidden Files: $dir:$(tput sgr 0)"
	HIDDEN="$(ls -ACq --ignore=[!.]* $1 --color=always 2> /dev/null)"
	if [ -z "$HIDDEN" ]; then
		echo "$(tput setaf 1)(none)$(tput sgr 0)"
	else
		ls -ACq --ignore=[!.]* $1 --color=always --group-directories-first 2> /dev/null
	fi

}
