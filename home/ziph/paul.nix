{ stadig, ... } : {
  imports = [
    stadig.paul
  ];
  thoughtfull = {
    gnome-terminal.enable = true;
    services.syncthing-init.folders = {
      org = {
        devices = [ "hemera" ];
        enable = true;
      };
      org-work = {
        devices = [ "hemera" ];
        enable = true;
      };
      sync = {
        devices = [ "hemera" ];
        enable = true;
      };
    };
  };
}
