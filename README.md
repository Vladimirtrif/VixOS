Common Issues  
  
No space left on device error during install:  
Haven't fixed this error myself but possible fixes: https://www.reddit.com/r/NixOS/comments/1cmb8up/no_space_left_on_device_during_install/


To install with Disko-Install:  

If hardware is the same as defined with hostname, in cmd run:
```
sudo nix --extra-experimental-features "flakes nix-command" run "github:nix-community/disko#disko-install" -- --flake "github:Vladimirtrif/VixOS#${hostname}" --disk main /dev/${ssd name} --write-efi-boot-entries
```
Options:  
hostname: the hostname defined in the config (one for each machine). Currently only option is "nixos"  
ssd name: the disk for nixos to install to, use lsblk to see names of available disks in your system


Else:  
copy or clone this git repo (use nix-shell -p git)    
replace hardware.nix with generated one from nixos (nixos-generate-config --show-hardware-config > VixOS/nixos/hardware.nix)  
then run command above replacing github url with path to local version of the repo
