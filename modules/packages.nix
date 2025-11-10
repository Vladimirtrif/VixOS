{
  pkgs,
  system,
  inputs,
  ...
}:
{

  # Allow closed source/unfree packages
  nixpkgs.config.allowUnfree = true;

  # enable for flatpak (spotify)
  services.flatpak.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

    #desktop apps
    inputs.zen-browser.packages."${system}".default
    discord
    thunderbird # email client
    nemo # gui file manager
    libreoffice
    #programming/work desktop apps
    vscodium
    slack
    postman
    # multimedia
    nicotine-plus # soulseek client
    stremio # media center
    vlc # media player
    strawberry # music player and tagger

    # TUI
    # neovim in hm
    rmpc # music player

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
    killall
    unzip

    #nixos tools
    home-manager

    #docker, qemu etc see virtualization module
  ];

  # for nixd
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
