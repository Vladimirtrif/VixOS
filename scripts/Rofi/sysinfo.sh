#!/usr/bin/env bash
source /home/vova/VixOS/scripts/consts.sh
# FOO a throwaway so rofi doesn't print sselected result
FOO=$(printf "%s\n" "$INFO" | rofi -dmenu -i)