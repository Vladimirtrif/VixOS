{ pkgs, ... }:

let
  consts = import ../consts.nix;
in
pkgs.writeShellApplication {
  name = "sysinfo-rofi";
  runtimeInputs = with pkgs; [
    rofi
  ];
  text = ''
    printf "%s\n" "${consts.INFO}" | rofi -dmenu -i	
  '';
}
