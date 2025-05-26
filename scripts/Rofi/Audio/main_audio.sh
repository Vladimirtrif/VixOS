#!/usr/bin/env bash

CHOSEN=$(printf "+5%%\n-5%%\n+10%%\n-10%%\nMute\n10%%\n20%%\n30%%\n40%%\n50%%\n60%%\n70%%\n80%%\n90%%\n100%%\nChange Devices\nAdvanced" | rofi -dmenu -i)

case "$CHOSEN" in
	"+5%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+;;
    "-5%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-;;
    "+10%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+;;
    "-10%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-;;
    "Mute") wpctl set-volume @DEFAULT_AUDIO_SINK@ 0%;;
    "10%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%;;
    "20%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 20%;;
    "30%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 30%;;
    "40%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 40%;;
    "50%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 50%;;
    "60%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 60%;;
    "70%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 70%;;
    "80%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 80%;;
    "90%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 90%;;
    "100%") wpctl set-volume @DEFAULT_AUDIO_SINK@ 100%;;
    "Change Devices") ./device_audio.sh;;
    "Advanced") pavucontrol;;
	
	*) exit 1 ;;
esac