{ lib, ... }:
{
  imports = [
    ./virtualisation.nix
    ./dev.nix
    ./gaming.nix
    ./common/bundle.nix
    ./desktop/default.nix
  ];

  desktop.enable = lib.mkDefault true;
  dev.enable = lib.mkDefault true;
  virtualisation.enable = lib.mkDefault true;
}
