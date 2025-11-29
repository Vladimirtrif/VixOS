{
  pkgs,
  lib,
  config,
  ...
}:
{

  config = lib.mkIf config.desktop.enable {
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
      kitty # enabled in kitty.nix in home-manager
      rofi-wayland
      #waybar
      pavucontrol
      hyprshot
      hyprlock # in hm hyprlock.nix
      dunst # in hm dunst.nix
    ];

  };
}
