#!/bin/bash

# WARNING: This script will replace your ~/.xsession and ~/.xinitrc.  It tries
# to behave, backup files, etc, but you use it at your own risk.

echo -n "Type YES if you are ready to setup awesome with gnome: "

read resp
if [ ! "$resp" = "YES" ] ; then
  echo "bye then"
  exit 0
fi

echo "Setting up the awesome wm with gnome"

pushd ~/

set -x

mv -v .xsession .xsession.before
mv -v .xinitrc .xinitrc.before

cat <<"EOS">~/.xsession
exec ck-launch-session gnome-session --session awesome "$@" 
EOS

chmod +x .xsession
ln -s ~/.xsession ~/.xinitrc

mkdir -p  ~/.config/gnome-session/sessions/

cat <<"EOS"> ~/.config/gnome-session/sessions/awesome.session
[GNOME Session]
Name=Awesome session
RequiredComponents=gnome-settings-daemon;
RequiredProviders=windowmanager;notifications;
DefaultProvider-windowmanager=awesome
DefaultProvider-notifications=notification-daemon
EOS

cat <<"EOS"> ~/local/share/applications/awesome.desktop
[Desktop Entry] 
Encoding=UTF-8
Name=awesome
Type=Application
Comment=Highly configurable framework window manager
TryExec=awesome
Exec=awesome
NoDisplay=true
X-GNOME-WMName=Awesome
X-GNOME-Autostart-Phase=WindowManager
X-GNOME-Provides=windowmanager
X-GNOME-Autostart-Notify=false
EOS

sudo mv -vf /usr/share/xsessions/xsession.desktop /usr/share/xsessions/xsession.desktop.before

cat <<"EOS"> /usr/share/xsessions/xsession.desktop
[Desktop Entry]
Name=Xsession
Comment=This just runs ~/.xsession
Exec=/etc/X11/Xsession
EOS


r=`which yum`

if [ "$?" = 0 ] ; then
  sudo aptitude install -y notification-daemon
else
  sudo yum install -y notification-daemon
fi