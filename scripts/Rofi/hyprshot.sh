#!/usr/bin/env bash

CHOSEN=$(printf "Capture Full Screen\nCapture Window\nCapture Selection\nClipboard Full Screen\nClipboard Window\nClipboard Selection" | rofi -dmenu -i)

case "$CHOSEN" in
	"Capture Full Screen") hyprshot -m output;;
    "Capture Window") hyprshot -m window;;
	"Capture Selection") hyprshot -m region;;
    "Clipboard Full Screen") hyprshot -m output --clipboard-only;;
    "Clipboard Window") hyprshot -m window --clipboard-only;;
	"Clipboard Selection") hyprshot -m region --clipboard-only;;
	
	*) exit 1 ;;
esac