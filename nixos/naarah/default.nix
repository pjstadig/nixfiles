{ config, pkgs, secrets, stadig, ... }: {
  age.secrets = {
    restic-env.file = secrets.age.restic-env;
    restic-passphrase.file = secrets.age.restic-passphrase;
  };
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
          enable = true;
          hostKeys = [
            secrets.initrd_ssh_host_ed25519_key
            secrets.initrd_ssh_host_rsa_key
          ];
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
  services = {
    nginx.enable = true;
    openssh.enable = true;
    syncthing = {
      enable = true;
      settings.folders = {
        archive = {
          devices = [ "carbon" "hemera" "raspi3b" "ziph" ];
          enable = true;
        };
        obsidian = {
          devices = [ "carbon" "hemera" "pixel" "pixel5a" "raspi3b" "ziph" ];
          enable = true;
        };
        org = {
          devices = [ "carbon" "hemera" "pixel" "pixel5a" "raspi3b" "ziph" ];
          enable = true;
        };
        sync = {
          devices = [ "bennu" "carbon" "hemera" "pixel" "pixel5a" "raspi3b" "ziph" ];
          enable = true;
        };
      };
    };
    vaultwarden.enable = true;
  };
  system = {
    autoUpgrade.flags = [
      "--override-input secrets git+ssh://git@nixfiles-secrets.github.com/pjstadig/nixfiles-secrets"
    ];
    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    stateVersion = "23.05"; # Did you read the comment?
  };
  thoughtfull = {
    deploy-keys = [ { name = "nixfiles-secrets"; } ];
    nginx.proxies."bw.stadig.name".backend = "http://localhost:8000";
    restic = {
      environmentFile = config.age.secrets.restic-env.path;
      passwordFile = config.age.secrets.restic-passphrase.path;
      s3Bucket = "stadig-restic";
    };
  };
}
