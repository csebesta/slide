# vi:syntax=sh

# Load xresources
xrdb ~/.Xresources

# Set cursor
xsetroot -cursor_name left_ptr

# Set background image
backinfo.solarized

# Execute xmonad
exec xmonad
