{config, pkgs, ...}: {
	imports = [
		./modules/bundle.nix
	];
	nixpkgs.config.allowUnfree = true;
	
	home = {
		username = "vova";
		homeDirectory = "/home/vova";
		stateVersion = "24.05";
	};
}
