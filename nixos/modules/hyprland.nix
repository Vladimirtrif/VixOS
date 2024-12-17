{pkgs, inputs, ...}: {
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

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

}