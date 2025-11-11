# Bare minimum system settings / packages required for all hosts
{
  pkgs,
  system,
  inputs,
  ...
}:
{

  # Allow closed source/unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #cli tools
    vim
    wget
    git
    killall
    unzip

    #nixos tools
    home-manager
  ];
}
