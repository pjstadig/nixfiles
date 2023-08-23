{ ... } : {
  thoughtfull.autoUpgrade = {
    flake = "github:pjstadig/nixfiles/main";
    inputs = [ "nixpkgs" ];
  };
}
