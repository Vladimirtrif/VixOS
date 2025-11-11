{ pkgs, inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vova = {
    isNormalUser = true;
    # Enable ‘sudo’ and docker for the user.
    extraGroups = [
      "wheel"
      "docker"
    ];
    home = "/home/vova";
  };

  home-manager = {
    # pass inputs to home-manager modules
    extraSpecialArgs = { inherit inputs; };
    users.vova = {
      imports = [
        ../../home/home.nix
        inputs.catppuccin.homeModules.catppuccin
      ];
    };
    backupFileExtension = "backup and rebuild";
  };

}
