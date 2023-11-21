{ ... }: {
  boot.initrd = {
    availableKernelModules = [
      "usb_storage"
    ];
    luks.devices.secure = {
      device = "/dev/sda1";
      preLVM = true;
    };
  };
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/97e81cf4-244f-4bc0-b077-022d1a90acf9";
      fsType = "ext4";
      options = [ "noatime" "nodiratime" "discard" ];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/b482371d-622c-455e-a4a7-f31722fa035e";
      fsType = "ext4";
      options = [ "noatime" "nodiratime" ];
    };
    # TODO: also mount firmware at /boot/firmware
    "/nix" = {
      device = "/dev/disk/by-uuid/a3523202-8195-4a86-864d-f2a3eb9c5c2c";
      fsType = "ext4";
      options = [ "noatime" "nodiratime" ];
    };
  };
  swapDevices = [{
    device = "/dev/disk/by-uuid/543e9d39-dc1f-4604-902b-b174532aba50";
  }];
}
