{
    # Allow closed source/unfree packages
   nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [

    #desktop apps
    vivaldi #browser

    #nixos tools
    home-manager
    #virtualbox guest (see virtualisation module)

    #cli tools
     vim
     wget

     #programming CLI tools
     gh
     git
     #docker (see virtualisation module)

     #programming languages
     go
   ];
}