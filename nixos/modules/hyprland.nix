{ pkgs, ... }:
{

  #hyprland itself
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  #portals for hyprland
  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [
          "xdph"
          "gtk"
        ];
        "org.freedesktop.portal.Settings" = [ "xdg-desktop-portal-gtk" ];
      };
    };
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  #hyprland utilities/plugins

  #programs.hyprlock = {
  #   enable = true;
  #};

  environment.systemPackages = with pkgs; [
    #kitty # enabled in kitty.nix
    rofi-wayland
    waybar
    pavucontrol
  ];

  fonts.packages = with pkgs; [
    font-awesome
  ];

}
