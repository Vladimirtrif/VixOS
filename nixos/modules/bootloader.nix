{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      useOSProber = true;
      # for EFI/disko
      #device = "nodev";
      devices = [ "nodev" ];
    };
  };
}
