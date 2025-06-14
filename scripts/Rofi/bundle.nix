{ pkgs, ... }:

{
  audio = import ./Audio/main_audio.nix { inherit pkgs; };
  screenshot = import ./hyprshot.nix { inherit pkgs; };
  networking = import ./networking.nix { inherit pkgs; };
  power = import ./power.nix { inherit pkgs; };
  quickSettings = import ./quickSettings.nix { inherit pkgs; };
  sysinfo = import ./sysinfo.nix { inherit pkgs; };
}
