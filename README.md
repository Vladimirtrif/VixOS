To install:  

If hardware is the same as defined with hostname, in cmd run:
```
sudo nix --extra-experimental-features "flakes nix-command" run "github:nix-community/disko#disko-install" -- --flake "github:Vladimirtrif/VixOS#${hostname}" --disk main /dev/${ssd name} --write-efi-boot-entries
```
Options:  
hostname: the hostname defined in the config (one for each machine). Currently only option is "nixos"  
ssd name: the disk for nixos to install to, use lsblk to see names of available disks in your system


Else:  
copy or clone this git repo  
replace hardware.nix with generated one from nixos (nixos-generate-config --show-hardware-config > VixOS/nixos/hardware.nix)  
then run command above replacing github url with path to local version of the repo
