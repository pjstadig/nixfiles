{ thoughtfull, ... } : {
  imports = [
    ./acme.nix
    ./desktop.nix
    ./home-manager.nix
    ./nix.nix
    ./ssh.nix
    thoughtfull.default
  ];
}
