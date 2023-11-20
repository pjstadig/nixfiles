{ config, pkgs, secrets, thoughtfull, ... }: {
  boot = {
    initrd = {
      availableKernelModules = [
        "usbhid"
        "usb_storage"
        "vc4"
        "pcie_brcmstb"      # required for the pcie bus to work
        "reset-raspberrypi" # required for vl805 firmware to load
      ];
    };
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };
  imports = [
    ./filesystems.nix
    ./hardware-configuration.nix
    ./root.nix
    thoughtfull.default
  ];
  networking = {
    domain = "stadig.name";
    hostName = "naarah"; # Define your hostname.
    interfaces.end0.useDHCP = true;
  };
  programs.zsh.enable = true;
  services.openssh.enable = true;
  system = {
    stateVersion = "23.05"; # Did you read the comment?
  };
}
