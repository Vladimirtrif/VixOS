{pkgs, inputs, ...}: {

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
      kitty
      #hyprpaper
      rofi-wayland
      waybar
    ];

    fonts.packages = with pkgs; [
      font-awesome
    ];

}