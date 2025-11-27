{ lib, osConfig, ... }:
lib.mkIf osConfig.desktop.enable {
  services.dunst.enable = true;
}
