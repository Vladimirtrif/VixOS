{
 disko.devices = {
    disk = {
      main = {
        type = "disk";
	      device = "/dev/sdc";
        content = {
          type = "gpt";
          partitions = {
          boot = {
              size = "1M";
              type = "EF02"; # for grub MBR
          };
          ESP = {
            size = "1G";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              };
            };
            swap = {
              size = "8G";
              content = {
                type = "swap";
                resumeDevice = true;
              };
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };
    };
  };
}
