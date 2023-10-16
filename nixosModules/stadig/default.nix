inputs : { ... } : {
  imports = [
    ./acme.nix
    ./desktop.nix
    ./home-manager.nix
    ./nix.nix
    ./ssh.nix
    inputs.thoughtfull.nixosModules.default
  ];
}
