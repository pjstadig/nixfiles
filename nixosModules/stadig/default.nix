inputs : { ... } : {
  imports = [
    ./acme.nix
    ./desktop.nix
    ./home-manager.nix
    ./nix.nix
    ./ssh.nix
    ./syncthing.nix
    inputs.thoughtfull.nixosModules.default
  ];
}
