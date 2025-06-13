{pkgs, ...}:

{
  rofi = import ./Rofi/bundle.nix { inherit pkgs; };
  dunst = import ./Dunst/bundle.nix { inherit pkgs; };
}