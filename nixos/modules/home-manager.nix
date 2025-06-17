{ inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  home-manager = {
    # pass inputs to home-manager modules
    extraSpecialArgs = { inherit inputs; };
    users.vova = {
      imports = [
        ../../home-manager/home.nix
         inputs.catppuccin.homeModules.catppuccin
      ];
    };
    backupFileExtension = "backup and rebuild";
  };
}
