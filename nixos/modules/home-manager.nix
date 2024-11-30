{inputs, ...}: {
    imports = [
        inputs.home-manager.nixosModules.default
    ];

    home-manager = {
        # pass inputs to home-manager modules
        extraSpecialArgs = { inherit inputs; };
        users = {
            "vova" = import ../../home-manager/home.nix;
        };
    };
}