{ lib, osConfig, ... }:
lib.mkIf osConfig.desktop.enable {
  programs.kitty.enable = true;
}
