{ pkgs, ... }:

{
  sysinfo = import ./sysinfo.nix { inherit pkgs; };
}
