{ config, lib, ... } : {
  services.xserver.displayManager.autoLogin = {
    enable = lib.mkDefault true;
    user = lib.mkDefault "paul";
  };
}
