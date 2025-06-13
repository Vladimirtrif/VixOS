{ pkgs, ... }:

{
  screenshot = import ./hyprshot.nix { inherit pkgs; };
}
