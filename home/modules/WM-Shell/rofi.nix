{
  osConfig,
  lib,
  ...
}:
lib.mkIf osConfig.desktop.enable {
  # Have stylix as default over catppuccin to make theme switching easier
  stylix.targets.rofi.enable = false;
  catppuccin.rofi.enable = true;
  programs.rofi = {
    enable = true;  
  };
}

