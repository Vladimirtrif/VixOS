{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      useOSProber = true;
      # for efi disko
      devices = [ "nodev" ];
    };
  };
}
