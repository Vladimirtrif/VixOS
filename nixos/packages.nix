{pkgs, system, inputs, ...}: {
    
  # Allow closed source/unfree packages
    nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
    environment.systemPackages = with pkgs; [

        #desktop apps
         vivaldi # TO DO: remove
         inputs.zen-browser.packages."${system}".default
         firefox
         spotify
         discord
         thunderbird # email client 


        #programming/work desktop apps
         vscodium
         slack
         postman

         #programming languages
         go

        #Hyprland and wayland stuff: see hyprland module for packages and home-manager for configs/plugins

        #cli tools
         vim
         wget
         # programming CLI
         gh
         git
         #docker (see virtualisation module)
         killall

        #nixos tools
         home-manager

        #virtualbox guest (see virtualisation module)
   ];
}
