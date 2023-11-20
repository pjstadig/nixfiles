{ ... }: {
  fileSystems = {
    "/" = {
      device = "/dev/mapper/naarah-root";
      fsType = "ext4";
      options = [ "noatime" "nodiratime" "discard" ];
    };
    "/boot" = {
      device = "/dev/mmcblk1p3";
      fsType = "ext4";
      options = [ "noatime" "nodiratime" ];
    };
    # "/boot/firmware" = {
    #   device = "/dev/disk/by-uuid/2178-694E";
    #   fsType = "vfat";
    #   options = [ "noatime" "nodiratime" ];
    # };
    "/nix" = {
      device = "/dev/mmcblk1p4";
      fsType = "ext4";
      options = [ "noatime" "nodiratime" ];
    };
  };
  swapDevices = [{
    device = "/dev/mapper/naarah-swap";
  }];
}
