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
