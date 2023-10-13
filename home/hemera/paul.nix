{ pkgs, stadig, thoughtfull, ... } : {
  home = {
    packages = with pkgs; [
      adapta-gtk-theme
      gparted
      monero-gui
      tor-browser-bundle-bin
      unstable.ledger-live-desktop
      virt-manager
    ];
    stateVersion = "22.05";
  };
  imports = [
    ./anki.nix
    stadig.paul
  ];
  thoughtfull = {
    gnome-terminal.enable = true;
    javascript.enable = true;
    services.syncthing-init.folders = {
      archive = {
        devices = [ "carbon" "raspi3b" ];
        enable = true;
      };
      obsidian = {
        devices = [ "carbon" "pixel" "pixel5a" "raspi3b" ];
        enable = true;
      };
      obsidian-work = {
        devices = [ "bennu" "carbon" ];
        enable = true;
      };
      org = {
        devices = [ "carbon" "pixel" "pixel5a" "raspi3b" ];
        enable = true;
      };
      org-work = {
        devices = [ "bennu" "carbon" ];
        enable = true;
      };
      sync = {
        devices = [ "bennu" "carbon" "pixel" "pixel5a" "raspi3b" ];
        enable = true;
      };
    };
  };
}
