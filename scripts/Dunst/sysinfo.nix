{ pkgs, ... }:

let
  consts = import ../consts.nix;
in
pkgs.writeShellApplication {
  name = "sysinfo-dunst";
  runtimeInputs = [
    pkgs.libnotify
  ];
  text = ''
    notify-send "Info" "${consts.INFO}"	
  '';
}
