# vi:syntax=sh

# Load xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

# Load xresources
xrdb ~/.Xresources

# Set cursor
xsetroot -cursor_name left_ptr

# Set background image
~/.scripts/backinfo

# Execute xmonad
exec xmonad
