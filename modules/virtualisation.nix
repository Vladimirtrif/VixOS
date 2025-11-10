{ pkgs, ... }:

{
  # virtualisation.virtualbox.guest.enable = true;

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    storageDriver = "overlay2";
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    quickemu # qemu cli/wrapper https://github.com/quickemu-project/quickemu?tab=readme-ov-file
  ];
}
