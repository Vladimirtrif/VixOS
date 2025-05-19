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

    #desktop apps
    inputs.zen-browser.packages."${system}".default
    spotify
    discord
    thunderbird # email client
    xfce.thunar # gui file manager
    stremio # media center
    vlc # media player
    libreoffice
    nicotine-plus
    #programming/work desktop apps
    vscodium
    slack
    postman

    #programming languages
    go
    nixd # LSP for nix
    nixfmt-rfc-style # formatter for nix

    #Hyprland and wayland stuff: see hyprland module for packages and home-manager for configs/plugins

    #cli tools
    vim
    wget
    # programming CLI
    gh
    git
    #docker (see virtualisation module)
    qemu
    killall
    unzip

    #nixos tools
    home-manager

    #virtualbox guest (see virtualisation module)
  ];

  # for nixd
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
