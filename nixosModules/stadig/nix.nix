{ lib, ... } : {
  thoughtfull.autoUpgrade = {
    flake = lib.mkDefault "github:pjstadig/nixfiles/nixos-23.11";
    inputs = [ "nixpkgs" ];
  };
}
