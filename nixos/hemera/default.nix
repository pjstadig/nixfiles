{ pkgs, stadig, ... }: {
  boot = {
    binfmt.emulatedSystems = [ "aarch64-linux" ];
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };
  hardware = {
    acpilight.enable = true;
    bluetooth.enable = true;
    ledger.enable = true;
    opengl.enable = true;
  };
  home-manager.users.root.home.stateVersion = "23.11";
  imports = [
    ./filesystems.nix
    ./hardware-configuration.nix
    ./paul.nix
    stadig.default
  ];
  networking.hostName = "hemera";
  services = {
    openssh.enable = true;
    trezord.enable = true;
  };
  system.stateVersion = "22.05";
  thoughtfull = {
    desktop.enable = true;
    greek.enable = true;
    vpn.home.enable = true;
  };
  virtualisation.libvirtd.enable = true;
}
