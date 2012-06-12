# Try to extend display automatically
#disper -e

# from https://awesome.naquadah.org/wiki/Quickly_Setting_up_Awesome_with_Gnome
# ck-launch-session is advised for the dbus stuff to work fine.
exec ck-launch-session gnome-session --session awesome "$@" 
