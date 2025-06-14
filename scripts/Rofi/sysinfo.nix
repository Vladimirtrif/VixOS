{ pkgs, ... }:

let
  consts = import ../consts.nix;
in
pkgs.writeShellApplication {
  name = "sysinfo-rofi";
  runtimeInputs = [
    pkgs.rofi-wayland
  ];
  text = ''
    printf "%s\n" "${consts.INFO}" | rofi -dmenu -i	
  '';
}
