#!/usr/bin/env bash

CHOSEN=$(printf "Audio\nScreenshot\nPower\nNetworking" | rofi -dmenu -i)

case "$CHOSEN" in
    "Audio") /home/vova/VixOS/scripts/Rofi/Audio/main_audio.sh;;
    "Screenshot") /home/vova/VixOS/scripts/Rofi/hyprshot.sh;;
    "Power") /home/vova/VixOS/scripts/Rofi/power.sh;;
    "Networking") /home/vova/VixOS/scripts/Rofi/networking.sh;;
	
	*) exit 1 ;;
esac