# Awesome + Gnome

Using gnome magic with the Awesome window manager to get a kick-ass WM with all
the magic goodies that a gnome desktop tries to bring (handling multiple
displays, resolution changes, notification stuff, etc).

*ck-launch-session* is used for helping make dbus stuff work.

Adjust for your favorite window manager

## Installation / Configuration

#### local home/user setup
Create a ~/.xsession file with the following contents

```
exec ck-launch-session gnome-session --session awesome "$@" 
```

Make it executable and create a symlink to .xinitrc (making startx behave the
same as a display manager login).

```
chmod +x ~/.xsession
ln -s ~/.xsession ~/.xinitrc
```

Create ~/.config/gnome-session/sessions/awesome.session

```
mkdir -p ~/.config/gnome-session/sessions/
touch ~/.config/gnome-session/sessions/awesome.session
```

with the following contents

```
[GNOME Session]
Name=Awesome session
RequiredComponents=gnome-settings-daemon;
RequiredProviders=windowmanager;notifications;
DefaultProvider-windowmanager=awesome
DefaultProvider-notifications=notification-daemon
```

Create ~/.local/share/applications/awesome.desktop

```
mkdir -p ~/.local/share/applications/
touch ~/.local/share/applications/awesome.session
```
with the following contents

```
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
```

#### System setup -- needed for when using a display manager using gnome app config files

Install the *notification-daemon* package or change the awesome.session config above to use a different provider:

```
DefaultProvider-notifications=notification-daemon
```

Create /usr/share/xsessions/xsession.desktop with the following contents:

```
[Desktop Entry]
Name=Xsession
Comment=This just runs ~/.xsession
Exec=/etc/X11/Xsession
```

## Misc/Other

 * To start awesome w/o gnome from the display manager create _/usr/share/xsessions/awesome.desktop_ (example included)
 * For a very simple Awesome configuration see simple_awesome_config/rc.lua
 * The *disper* application can be used to control display configuration.
