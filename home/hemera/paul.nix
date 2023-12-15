{ pkgs, stadig, ... } : {
  home = {
    packages = with pkgs; [
      adapta-gtk-theme
      calibre
      gparted
      monero-gui
      tor-browser-bundle-bin
      unstable.ledger-live-desktop
      virt-manager
    ];
    stateVersion = "23.11";
  };
  imports = [
    ./anki.nix
    stadig.paul
  ];
  thoughtfull = {
    gnome-terminal.enable = true;
    services.syncthing-init.folders = {
      archive = {
        devices = [ "carbon" "naarah" "raspi3b" ];
        enable = true;
      };
      obsidian = {
        devices = [ "carbon" "naarah" "pixel" "pixel5a" "raspi3b" ];
        enable = true;
      };
      obsidian-work = {
        devices = [ "bennu" "carbon" ];
        enable = true;
      };
      org = {
        devices = [ "carbon" "naarah" "pixel" "pixel5a" "raspi3b" ];
        enable = true;
      };
      org-work = {
        devices = [ "bennu" "carbon" ];
        enable = true;
      };
      sync = {
        devices = [ "bennu" "carbon" "naarah" "pixel" "pixel5a" "raspi3b" ];
        enable = true;
      };
    };
  };
}
