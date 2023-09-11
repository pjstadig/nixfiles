{ lib, ... } : {
  thoughtfull.autoUpgrade = {
    flake = lib.mkDefault "github:pjstadig/nixfiles/main";
    inputs = [ "nixpkgs" ];
  };
}
