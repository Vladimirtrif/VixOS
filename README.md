Installing (Easiest method):

Fork (or copy) this repo to your own (alternatively use nix-shell, see docs for 2nd possible issue below).  

Change the main disk name in disko.nix to the disk you want to install NixOS on (default is /dev/sda) and change your username to what you want it to be. Optionally change hostName (default is nixos).   

Boot into live usb with nixos minimal iso  

In tty run disko to partition drive according the config
```
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko --flake "github:YourUserName/YourRepoFork#hostName"
```
In tty install nixos according to flake (will ask you to set root password)
```
sudo nixos-install --flake "github:YourUserName/YourRepoFork#hostName"
```
Reboot and login to root. Then set password for your user
```
sudo passwd yourUserName
```
Logout, login to your user. Git clone your repo and update your hardware configuration 
```
cd YourRepoFork
nixos-generate-config --show-hardware-config > nixos/hardware-configuration.nix
sudo nixos-rebuild switch --flake .
```

Lastly run the home-manager command to generate all configs
```
home-manager switch --flake ./
```

Possible Issues:  

Error: The last command, nixos-rebuild, has the error "the option filesystems / .device has conflicting definitionvalues"  
Cause: the auto generated hardware config generated info about file system, however this is also defined in our disko.nix  
Solution: delete the filesystem info from the hardware-configuration.nix (with vim)  

Error: After nixos install can't boot into nixos/no working system at boot  
Cause: Possible cause is the hardware config from my repo is incompatible with your system  
Solution: replace the hardware-configuration.nix with the autogenerated config before nixos-install. Do this in tty in live usb with nix-shell running command 

```
nix-shell -p git
```

From here you can use git clone and edit it with nano. For the nixos-install step replace the "github:YourUserName/YourRepoFork#hostName" with the path to your local cloned repo folder. 
