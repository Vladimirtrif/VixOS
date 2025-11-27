{ lib, osConfig, ... }:
lib.mkIf osConfig.desktop.enable {
  programs.hyprlock.enable = true;
}
