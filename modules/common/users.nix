{
  inputs,
  vars,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${vars.username} = {
    isNormalUser = true;
    # Enable ‘sudo’ and docker for the user.
    extraGroups = [
      "wheel"
      "docker"
    ];
    home = "/home/${vars.username}";
  };

  home-manager = {
    # pass inputs to home-manager modules
    extraSpecialArgs = { inherit inputs vars; };
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup and rebuild";
    users.vova = {
      imports = [
        ../../home/default.nix
        inputs.catppuccin.homeModules.catppuccin
      ];
    };
  };
}
