{ stadig, ... }: {
  home.stateVersion = "22.05";
  imports = [
    stadig.paul
  ];
  programs = {
    git = {
      userEmail = "paul@stadig.name";
      userName = "Paul Stadig";
    };
    tmux.enable = true;
  };
  services.syncthing.extraOptions = [
    "--gui-address=0.0.0.0:8384"
  ];
  thoughtfull.services.syncthing-init.folders = {
    archive = {
      devices = [ "carbon" "hemera" "naarah" "ziph" ];
      enable = true;
    };
    obsidian = {
      devices = [ "carbon" "hemera" "naarah" "pixel" "pixel5a" "ziph" ];
      enable = true;
    };
    org = {
      devices = [ "carbon" "hemera" "naarah" "pixel" "pixel5a" "ziph" ];
      enable = true;
    };
    sync = {
      devices = [ "bennu" "carbon" "hemera" "naarah" "pixel" "pixel5a" "ziph" ];
      enable = true;
    };
  };
}
