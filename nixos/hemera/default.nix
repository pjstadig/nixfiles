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
    # zoom requires opengl be disabled; maybe related to
    # https://github.com/NixOS/nixpkgs/issues/82959 though I don't get a core dump
    opengl.enable = false;
  };
  home-manager.users.root.home.stateVersion = "23.11";
  imports = [
    ./filesystems.nix
    ./hardware-configuration.nix
    ./paul.nix
    stadig.default
  ];
  networking.hostName = "hemera";
  programs.adb.enable = true;
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
