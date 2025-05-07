#!/usr/bin/env bash

CHOSEN=$(printf "Inc Vol +5%%\nDec Vol -5%%\nInc Vol +10%%\nDec Vol -10%%\nMute\nVol 10%%\nVol 20%%\nVol 30%%\nVol 40%%\nVol 50%%\nVol 60%%\nVol 70%%\nVol 80%%\nVol 90%%\nVol 100%%\nChange Devices\nAdvanced" | rofi -dmenu -i)

case "$CHOSEN" in
	"Inc Vol +5%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+;;
    "Dec Vol -5%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-;;
    "Inc Vol +10%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+;;
    "Dec Vol -10%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-;;
    "Mute") wpctl set-volume @DEFAULT_AUDIO_SINK@ 0%;;
    "Vol 10%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%;;
    "Vol 20%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 20%;;
    "Vol 30%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 30%;;
    "Vol 40%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 40%;;
    "Vol 50%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 50%;;
    "Vol 60%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 60%;;
    "Vol 70%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 70%;;
    "Vol 80%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 80%;;
    "Vol 90%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 90%;;
    "Vol 100%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 100%;;
    "Change Devices") ./device_audio.sh;;
    "Advanced") pavucontrol;;
	
	*) exit 1 ;;
esac