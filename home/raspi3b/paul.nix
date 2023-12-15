{ stadig, ... }: {
  home.stateVersion = "23.11";
  imports = [
    stadig.paul
  ];
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
