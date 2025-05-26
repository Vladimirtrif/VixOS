{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      ags,
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      # define your extraPackages once
      myExtraPackages = [
        # e.g. ags.packages.${system}.battery
        ags.packages.${system}.hyprland
      ];
    in
    {
      packages.${system}.default = ags.lib.bundle {
        inherit pkgs;
        src = ./.;
        name = "my-shell"; # name of executable
        entry = "app.ts";
        gtk4 = true;

        # additional libraries and executables to add to gjs' runtime
        extraPackages = myExtraPackages;
      };

      devShells.${system}.default = pkgs.mkShell {
        shellHook = ''
          echo "Welcome to AGS shell"
        '';
        buildInputs = [
          # includes astal3 astal4 astal-io by default
          (ags.packages.${system}.default.override {
            extraPackages = myExtraPackages;
          })
        ];
      };
    };
}
