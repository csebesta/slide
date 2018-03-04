# vi:syntax=sh

# Load xresources
xrdb ~/.Xresources

# Set cursor and start xmonad
xsetroot -cursor_name left_ptr
exec xmonad
