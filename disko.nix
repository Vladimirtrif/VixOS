{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme1n1";
        content = {
          type = "gpt";
          partitions = {
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
      ssd1 = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            full = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/ssd1";
              };
            };
          };
        };
      };
      hdd1 = {
        type = "disk";
        device = "/dev/sdc";
        content = {
          type = "gpt";
          partitions = {
            full = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/hdd1";
              };
            };
          };
        };
      };
    };
  };
}
