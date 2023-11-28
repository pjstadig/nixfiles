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
  imports = [
    ./filesystems.nix
    ./hardware-configuration.nix
    ./paul.nix
    stadig.default
  ];
  networking.hostName = "hemera";
  programs = {
    ssh.extraConfig = ''
      Host *.local
        ForwardAgent yes
      Host raspi3b.lan
        ForwardAgent Yes
        Hostname raspi3b.lan
        User root
      Host raspi3b
        ForwardAgent Yes
        Hostname raspi3b.lan
        RemoteCommand tmux att
        RequestTTY yes
        User root
      Host unlock.raspi3b.lan
        Hostname raspi3b.lan
        Port 222
    '';
  };
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
