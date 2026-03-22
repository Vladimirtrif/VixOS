{ lib, osConfig, ... }:
lib.mkIf osConfig.desktop.enable {
  programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
    extraConfig = builtins.readFile ./wezterm.lua;
  };
}
