{ lib, ... }:
{
  imports = [
    ./hyprland.nix
    ./packages.nix
    ./stylix.nix
  ];

  options = {
    desktop.enable = lib.mkEnableOption "Enables desktop apps/GUI";
  };
}
