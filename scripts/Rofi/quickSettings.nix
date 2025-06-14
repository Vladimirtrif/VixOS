{ pkgs, ... }:

let
  networking = import ./networking.nix { inherit pkgs; };
  audio = import ./Audio/main_audio.nix { inherit pkgs; };
  power = import ./power.nix { inherit pkgs; };
  screenshot = import ./hyprshot.nix { inherit pkgs; };
  getExe = pkgs.lib.getExe;
in
pkgs.writeShellApplication {
  name = "quicksettings-rofi";
  runtimeInputs = [
    pkgs.rofi-wayland
  ];
  text = ''
    CHOSEN=$(printf "Audio\nScreenshot\nPower\nNetworking" | rofi -dmenu -i)

    case "$CHOSEN" in
        "Audio") ${getExe audio};;
        "Screenshot") ${getExe screenshot};;
        "Power") ${getExe power};;
        "Networking") ${getExe networking};;
    	
    	*) exit 1 ;;
    esac
  '';
}
