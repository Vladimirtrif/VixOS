#!/usr/bin/env bash

CHOSEN=$(printf "Volume +5%%\nVolume -5%%\nChange Devices" | rofi -dmenu -i)

case "$CHOSEN" in
	"Volume +5%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+;;
    "Volume -5%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-;;
    "Change Devices") ./device_audio.sh;;
	
	*) exit 1 ;;
esac