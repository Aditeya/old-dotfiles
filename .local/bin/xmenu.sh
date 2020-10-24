#!/bin/sh

cat <<EOF | xmenu | sh &
Applications
	IMG:/home/aditeya/.local/share/xmenu/icons/web.png	Web Browser	$BROWSER
	IMG:/home/aditeya/.local/share/xmenu/icons/thunderbird.png	Thunderbird	thunderbird
	IMG:/home/aditeya/.local/share/xmenu/icons/gimp.png	Image editor	gimp
Games
	IMG:/home/aditeya/.local/share/xmenu/icons/multimc.png	Minecraft	multimc
	IMG:/home/aditeya/.local/share/xmenu/icons/steam.png	Steam	steam
Terminal (st)		st

Shutdown		poweroff
Reboot			reboot
EOF
