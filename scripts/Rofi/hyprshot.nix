{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "hyprshot-rofi";
  runtimeInputs = [
    pkgs.rofi-wayland
    pkgs.hyprshot
  ];
  text = ''
    		CHOSEN=$(printf "Clipboard Selection\nCapture Selection\nClipboard Window\nCapture Window\nClipboard Full Screen\nCapture Full Screen" | rofi -dmenu -i)

    		case "$CHOSEN" in
    			"Clipboard Selection") hyprshot -m region --clipboard-only;;
    			"Capture Selection") hyprshot -m region -o ~/Pictures/Screenshots/;;
    			"Clipboard Window") hyprshot -m window --clipboard-only;;
    			"Capture Window") hyprshot -m window -o ~/Pictures/Screenshots/;;
    				"Clipboard Full Screen") hyprshot -m output --clipboard-only;;
    			"Capture Full Screen") hyprshot -m output -o ~/Pictures/Screenshots/;;
    			*) exit 1 
    		esac
    	'';
}
