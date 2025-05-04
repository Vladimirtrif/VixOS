#!/usr/bin/env bash

CHOSEN=$(printf "Sleep\nShutdown\nReboot\nLock\nSuspend\nHibernate" | rofi -dmenu -i)

case "$CHOSEN" in
    "Sleep") systemctl suspend-then-hibernate;;
	"Shutdown") systemctl shutdown now;;
    "Reboot") reboot;;
    "Lock") hyprlock;;
    "Suspend") systemctl suspend;;
    "Hibernate") systemctl hibernate;;
	
	*) exit 1 ;;
esac