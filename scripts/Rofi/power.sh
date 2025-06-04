#!/usr/bin/env bash

CHOSEN=$(printf "Shutdown\nSleep\nReboot\nLock\nSuspend\nHibernate" | rofi -dmenu -i)

case "$CHOSEN" in
    "Shutdown") shutdown now;;
    "Sleep") systemctl suspend-then-hibernate;;
    "Reboot") reboot;;
    "Lock") hyprlock;;
    "Suspend") systemctl suspend;;
    "Hibernate") systemctl hibernate;;
	
	*) exit 1 ;;
esac