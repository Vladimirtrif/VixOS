{

	description = "My System Config";
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
		disko.url = "github:nix-community/disko";
		disko.inputs.nixpkgs.follows = "nixpkgs";
		#hyprland = {
		#	url = "github:hyprwm/Hyprland";
		#	inputs.nixpkgs.follows = "nixpkgs";
		#};

		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";	
		};	 
	};
	outputs = inputs@{self, nixpkgs, home-manager,  ... }: 
		let
			system = "x86_64-linux";
		in {
			nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
				inherit system;
				specialArgs = { inherit inputs; };
				modules = [
					 ./nixos/configuration.nix
					inputs.disko.nixosModules.disko
					];
			};

			homeConfigurations.vova = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages.${system};
				modules = [ ./home-manager/home.nix ];
			};
		};
}
