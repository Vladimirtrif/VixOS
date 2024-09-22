Requirements: Bootable USB with NixOS minimal ISO and at least 16gb ram (possible with less but not tested and might run into error documented below)  

To install with Disko-Install: 

Boot into live usb of NixOS minimal iso. 

If hardware is the same as defined with hostname, in tty run:
```
sudo nix --extra-experimental-features "flakes nix-command" run "github:nix-community/disko#disko-install" -- --flake "github:Vladimirtrif/VixOS#${hostname}" --disk main /dev/${ssd name} --write-efi-boot-entries
```
Options:  
hostname: the hostname defined in the config (one for each machine). Currently only option is "nixos"  
ssd name: the disk for nixos to install to, use lsblk to see names of available disks in your system


If hardware.nix has to be differentfor your machine:   
copy or clone this git repo (use nix-shell -p git)    
replace hardware.nix with generated one from nixos (nixos-generate-config --show-hardware-config > VixOS/nixos/hardware.nix)  
then run command above replacing github url with path to local version of the repo  

Remember, don't forget to set a password after install.

Common Issues:  
  
Error: No space left on device error (during install)  
Causes: Nixos store uses a tmpfs folder during install. If you don't have enough ram (tmpfs folders are half your ram size) or the usb your installing from is too small, this error will occur.   
Solution: Haven't fixed this error myself but possible fixes: https://www.reddit.com/r/NixOS/comments/1cmb8up/no_space_left_on_device_during_install/ https://www.reddit.com/r/NixOS/comments/103hx2u/i_deleted_almost_all_previous_generations_did_a/  
