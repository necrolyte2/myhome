# Load Xresources goodies
xrdb -load ~/.Xresources

#### Taken from http://codylittlewood.com/arch-linux-on-macbook-pro-installation
# Handles stuff related to NetworkManager...I think
# Start a D-Bus session
source /etc/X11/xinit/xinitrc.d/30-dbus
# Start a GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# You probably need to do this too
export SSH_AUTH_SOCKET
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID
#### END codylitlewood stuff ####

# Have awesome take over this process
exec awesome
