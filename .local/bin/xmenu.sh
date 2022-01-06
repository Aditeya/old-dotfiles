#!/bin/sh

ICONPATH=/home/aditeya/Code/xmenu/icons

cat <<EOF | xmenu | sh &
Applications
	IMG:$ICONPATH/web.png	Web Browser	$BROWSER
	IMG:$ICONPATH/thunderbird.png	Thunderbird	thunderbird
	IMG:$ICONPATH/gimp.png	Image editor	gimp
	IMG:$ICONPATH/signal.png	Signal	signal-desktop
Games
	IMG:$ICONPATH/multimc.png	Minecraft	multimc
	IMG:$ICONPATH/steam.png	Steam	lsi-steam
Terminal (st)		st

Shutdown		poweroff
Reboot			reboot
EOF
