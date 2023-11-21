{ config, pkgs, secrets, stadig, ... }: {
  boot = {
    initrd = {
      availableKernelModules = [
        "pcie_brcmstb"      # required for the pcie bus to work
        "reset-raspberrypi" # required for vl805 firmware to load
        "usbhid"
        "vc4"
      ];
      network = {
        enable = true;
        ssh = {
          authorizedKeys = config.users.users.root.openssh.authorizedKeys.keys;
          enable = true;
          hostKeys = [
            secrets.initrd_ssh_host_ed25519_key
            secrets.initrd_ssh_host_rsa_key
          ];
          port = 222;
        };
      };
    };
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };
  hardware.raspberry-pi."4".poe-hat.enable = true;
  imports = [
    ./filesystems.nix
    ./hardware-configuration.nix
    ./paul.nix
    ./root.nix
    stadig.default
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
