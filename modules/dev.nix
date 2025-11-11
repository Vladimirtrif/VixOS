# Dev tools and packages
{
  pkgs,
  inputs,
  ...
}:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #programming/work desktop apps
    vscodium
    slack
    postman
    # TUI
    # neovim in hm

    #programming languages
    go
    nixd # LSP for nix
    nixfmt-rfc-style # formatter for nix

    #Hyprland and wayland stuff: see hyprland module for packages and home-manager for configs/plugins

    # programming CLI
    gh
  ];

  # for nixd
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
