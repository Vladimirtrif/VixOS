To install:

If hardware is the same as defined with hostname, in cmd run:
sudo nix --extra-experimental-features "flakes nix-command" run "github:nix-community/disko#disko-install" -- --flake:"github:Vladimirtrif/VixOS#${hostname}" --disk main dev/${ssd name}

Else:
copy git repo
replace hardware.nix with generated one from nixos (nixos-generate-config --show-hardware-config > VixOS/nixos/hardware.nix)
run "sudo nix --extra-experimental-features "flakes nix-command" run "github:nix-community/disko#disko-install" -- --flake:"./VixOS#${hostname}" --disk main dev/${ssd name}"
