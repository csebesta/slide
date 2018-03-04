#!/bin/bash
# ~/.bash_aliases: a file containing user added aliases

# Chromecast alias for local files
# Requires knowledge of device ip address
cast () {

	# Exit media after playback, launch without gui, and cast to device
	vlc --play-and-exit \
		--intf dummy \
		--sout="#chromecast{ip=192.168.0.109}" $1 > /dev/null 2>&1 &

}

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

alias ghc='ghc -hidir /tmp -odir /tmp'

# Redshift aliases
# Use 'redshift -x' to reset values
alias night='redshift -O 3700k > /dev/null 2>&1'
alias day='redshift -O 5500k > /dev/null 2>&1'

# Screen recording aliases
alias bz='byzanz-record --delay=3'

# Sudo does not work with aliases without an additional space
alias sudo='sudo '

# Default to human readable outputs
alias df='df -h'
alias free='free -h'

# Aliases for scripts that replace or modify pre-existing program behavior
alias tilda="$HOME/.bin/tildash"
alias pm-suspend="$HOME/.bin/pm-suspend"

# Change beep to visual representation
# Critical urgency allows notification in fullscreen applications
# Icon: /usr/share/icons/Ultra-Flat/actions/scalable/stock_about.svg
# Icon: /usr/share/icons/Ultra-Flat/emblems/scalable/emblem-ok.svg
# Aliases are not expanded in scripts, but functions do expand

# Visual beep
export ICN='/usr/share/icons/HighContrast/48x48/emblems/emblem-ok.png'
beep () {
	notify-send -u critical -i $ICN 'beep'
}

# Notifications
export NICN='/usr/share/icons/HighContrast/48x48/emblems/emblem-important.png'
notify () {
	notify-send -u critical -i $NICN "$1" "$2"
}

# lf: A function to display an organized list of normal and hidden files.
# Useful for getting a quick read on certain directories
# Almost works but '..directory' will not show
#HIDDEN="$(cd $1 && ls -Cdq .[!.]* --color=always 2> /dev/null)"
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
