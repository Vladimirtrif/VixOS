{pkgs, ...}: {
    
    # Allow closed source/unfree packages
   nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [

    #desktop apps
    vivaldi #browser

    #Hyprland and wayland stuff
    #Also see hyrpland module for packages and home-manager for configs/plugins

    #cli tools
     vim
     wget

     #programming apps and tools
     gh
     git
     #docker (see virtualisation module)

     #programming languages
     go

     #nixos tools
    home-manager
    #virtualbox guest (see virtualisation module)
   ];
}