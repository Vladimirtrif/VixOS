{
  lib,
  config,
  pkgs,
  ...
}:

lib.mkIf config.desktop.enable {
  programs.mango.enable = true;
  environment.systemPackages = with pkgs; [
    kitty # dependency, also in hm and packages
    rofi
    #waybar
    pavucontrol
    #hyprshot
    dunst # in hm dunst.nix
    slurp
  ];
}
